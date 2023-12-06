//
//  AliyunpanError.swift
//  AliyunpanSDK
//
//  Created by zhaixian on 2023/11/22.
//

import Foundation

/// 授权错误
public enum AliyunpanAuthorizeError: Error {
    /// 错误的授权链接
    case invaildAuthorizeURL
    /// 当前设备未安装阿里云盘
    case notInstalledApp
    /// 授权错误
    case authorizeFailed(error: String?, errorMsg: String?)
}

/// 网络层错误
public struct AliyunpanServerError: Error, Decodable {
    public enum Code: String, Decodable {
        /// 二维码过期
        case qrCodeExpired = "QRCodeExpired"
        /// 容量超限
        case quotaExhaustedDrive = "QuotaExhausted.Drive"
        /// access_token 过期
        case accessTokenExpired = "AccessTokenExpired"
        /// access_token 格式不对
        case accessTokenInvalid = "AccessTokenInvalid"
        /// refresh_token 过期
        case refreshTokenExpired = "RefreshTokenExpired"
        /// refresh_token 格式不对
        case refreshTokenInvalid = "RefreshTokenInvalid"
        /// 用户已取消授权，或权限已失效，或 token 无效。需要重新发起授权
        case permissionDenied = "PermissionDenied"
        /// 回收站文件不允许操作
        case forbiddenFileInTheRecycleBin = "ForbiddenFileInTheRecycleBin"
        /// 用户容量超限，限制播放，需要扩容或者删除不必要的文件释放空间
        case exceedCapacityForbidden = "ExceedCapacityForbidden"
        /// 文件找不到
        case notFound = "NotFound.FileId"
        /// 请求过快
        case tooManyRequests = "TooManyRequests"
    }
    
    public let code: Code?
    public let message: String?
    public let requestId: String?
    
    public var isAccessTokenInvalidOrExpired: Bool {
        code == .accessTokenExpired || code == .accessTokenInvalid
    }
}

public enum AliyunpanNetworkSystemError: Error {
    case invaildURL
    case httpError(statusCode: Int, data: Data, response: HTTPURLResponse)
}