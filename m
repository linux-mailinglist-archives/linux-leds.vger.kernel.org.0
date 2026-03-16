Return-Path: <linux-leds+bounces-7361-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JGPAE3Tt2n0VgEAu9opvQ
	(envelope-from <linux-leds+bounces-7361-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 16 Mar 2026 10:54:21 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E72297753
	for <lists+linux-leds@lfdr.de>; Mon, 16 Mar 2026 10:54:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0015F306EE19
	for <lists+linux-leds@lfdr.de>; Mon, 16 Mar 2026 09:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6DD33921E6;
	Mon, 16 Mar 2026 09:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hl+Lf4vz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M93Wp13i"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E35391854
	for <linux-leds@vger.kernel.org>; Mon, 16 Mar 2026 09:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773654361; cv=none; b=C0kUyN8CXOH4/cy1mXqqV+MRc2Rp6UQ+KvezbmV7o7ZLaaBxW87tL0BYuWXYrV9vZ0LjJ5zoZxDf9mfU5UIRaEX9N/pMDyMQrQM1JTcvbFNbJCeHI8Pp7De56OtWbe2BFtsjaX731Mhj5yeRHVKHggULbThOecyrnPmjMsHJKXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773654361; c=relaxed/simple;
	bh=F9ytT2vvzgyeiU8WNksbCaFX6Hz61vWU6GkVZMPweL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=alOYVMWnmaNUCJPZ3NZZoKaJPWV7RX6OuzPPQeoVUh/DGm+KNJ+G3MF2xjG2pLT3nELgR+rVH1cNGMiXPMYeuDR8L3r1pWrhyZ2SwNTAp48yEbeqPyB8ki+P8X5kw3qBFuRnvvB3SVkJQ6iK0FgyoiH4ctmrVOiReGdvURt5Abw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hl+Lf4vz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M93Wp13i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64mE62128637
	for <linux-leds@vger.kernel.org>; Mon, 16 Mar 2026 09:45:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y0W/aAHjyOJ2UAuyH9PergzDfCRCX5QEy6ZK0Vjabsc=; b=Hl+Lf4vzQn30io76
	uYKe/wekuPGHSCD0rDQuZCjaU4RRXLKlEdbTTQyBHIVcqcX7dyBk7/HSVyrShVuR
	VpFWb9CW5spylabrF+lL1RbHl3MOTCqyRaxjBGQbOSEdN0SnwIEmh2sm5PzLsa62
	wYsvkO5v03lh9l8NjrOoLRMHnWFZtqP9u1mRYS6I32QEan4yCXrDMbYVHRcqQ/9D
	3c/4TD5TMX4Em6ADmMb0SSLht8CvklmVQKEtoKxytufUza4m0b/FKpSXKadcJUzh
	M9rDc/soWG2pmcCGTGsJbllAYOym+wWcoRi07/Ric2/y8qIrlp9fgqcU44T8B2PP
	rAd+xA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw00an5jh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Mon, 16 Mar 2026 09:45:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd84943c76so3973282485a.0
        for <linux-leds@vger.kernel.org>; Mon, 16 Mar 2026 02:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773654359; x=1774259159; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y0W/aAHjyOJ2UAuyH9PergzDfCRCX5QEy6ZK0Vjabsc=;
        b=M93Wp13iGsvelwKMc/qfujoHdwXW/nphRoiJOqh/X/HBVeir7t++E5F/oTUlbSVkd7
         u5CAqXzSamFq8+0bp/wEXrsQjOzTH8dDAGGeLkGUkMYz01VUqqPKGDwflJHmLyRzf9B0
         /QrSmm54+dffDPw6cTWzyYYeCsp7TqEvKVjaImGoOb/cPoW5m32Ed1lNlDs4zfJW4BCb
         jTKP3xQsurOb7Y7qL+JKoUT2tlfbW7f7suh7V136PMLe2lGSpr3wNYiI5IqDSY7fQ9G7
         s/EeF4jYDiFsTsbXwhvokZ64hKIvbI8Z2MSqvOnYN3L+S0c264n6evgU0GJwGI5P3e9N
         PzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773654359; x=1774259159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y0W/aAHjyOJ2UAuyH9PergzDfCRCX5QEy6ZK0Vjabsc=;
        b=X3zYMpP8na6FD6plN+hXUOIsu9gcAShxTGtZDA0hleQueMhVFVKFoAmP5iUkY9Vgi3
         Cs2IV2mh4E445LqZM5N9mfFzIyKxECYVTFfaTjildcJqN2M8gWRalnqWfWrakrrXgmbl
         /1pFBzeQxudAj8m/PPbhhXlpA9HVMMoQjKqjfS0GWI9sgo5lIiaEcyprOnaWgxD315QW
         3TXT+omAD4+zdeoM2/Cp2HB8WhKF/1EjWemgg5q2Eo4gY+d9ynww3NWPwzJkmdByBAhj
         uaWM3p+n6wg4pWyG0edVz4VZqbg8YQUJ14DR/fTs/7+RgjK1eSbm35Y/g+AlS7mVIKC4
         VcCg==
X-Forwarded-Encrypted: i=1; AJvYcCVl7ZG1Zi+J66e2xvnxeUp9g4d7RTQ39qRhJh+gB3VaSSyMxEi1nVP0ChSMfz+ndqUY/ymrBtotDpq9@vger.kernel.org
X-Gm-Message-State: AOJu0YzCfjPXGC0WeD5+0ugQUQR179wKywnO2Tzd+S8sh8/mRQKmzqd8
	8JSG7FDsNSqsMejU53Ofrbr6HBf4Q2A/N1z4VauWsogFm0sI8qhMv7zWGeO+8KIDDT3InJJeozF
	FgNnZKsfnmVVdmqs1q7V1LeavkpfacCoF2LkqtG4WjMwCH10GVaAa2W1IAHGgnkmz
X-Gm-Gg: ATEYQzxbhktcZ6VjEjhJLCKI3SePoPrr0LyF62oq5RmvSH3AymRxS+Ujxzy33tAnM4N
	33HAOgYlG+qsZ8M4gFzVyA81PXvh7KOebgv9X1a7LUJmLUCS7n2/TILe330tC3u0TZPXz0VV5ru
	72/S91/b2TFhOYTM2381QehvYm28Mb8qUpJvNzEQ4g6HzOBiJEemRQRr2M5fVq7IwHS9VIRe3HL
	QXRxiyASLhUnyB4B4ZfHt7F6siGls7Eb25lKILEC2sI93AeK0/wV/HEUdngtVDO5pVOV+ToD7D6
	xnq4v7F4QvM+K9o+R6ZU8ycK62q7PyraMzDhllTRfufbtAtYtK1myLqsRjLnIYQvKNiYWDqc8Es
	ZrglhU+m5M/T7UJWrPDVKOUY04dX9EZbIZV0tWnm4gXxLkmUayesY
X-Received: by 2002:a05:620a:4414:b0:8cd:8c3f:af1 with SMTP id af79cd13be357-8cdaa77964emr1854274385a.1.1773654358729;
        Mon, 16 Mar 2026 02:45:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4414:b0:8cd:8c3f:af1 with SMTP id af79cd13be357-8cdaa77964emr1854269485a.1.1773654358246;
        Mon, 16 Mar 2026 02:45:58 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:ba9e:e504:fb0b:f1f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ab9f9esm503138755e9.4.2026.03.16.02.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:45:57 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:45:27 +0100
Subject: [PATCH v2 7/9] staging: media: max96712: drop unneeded dependency
 on OF_GPIO
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-gpio-of-kconfig-v2-7-de2f4b00a0e4@oss.qualcomm.com>
References: <20260316-gpio-of-kconfig-v2-0-de2f4b00a0e4@oss.qualcomm.com>
In-Reply-To: <20260316-gpio-of-kconfig-v2-0-de2f4b00a0e4@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Linus Walleij <linusw@kernel.org>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: brgl@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-pm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=833;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=F9ytT2vvzgyeiU8WNksbCaFX6Hz61vWU6GkVZMPweL4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt9FArM50N/90ynxEVRSFS/NTT+j+yQ+OqAswC
 54EDd8PnAaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfRQAAKCRAFnS7L/zaE
 w2ctD/9MKhohFhmRczPRr/AMx2JLdR9z7oMk+n5G8a1FtSDO5CTL607Gw7uz2zxKSciC11ogeJr
 3zFe8JsK1XRF2Nu24Z+zpR/oPpteX5Wq4AbVhT9cpLvZ0xGhjDiRzGQ+DO2Tftfq/Wx9WThBg/l
 68zbOWyVB4guzZaqOR0Wabb2NW05sEPwZKD6OafKLL16116FzD3ed/5tRszdwWGmzWghLrXyFZ3
 0fuw+qk16knXb6E7eaesQ77axJsF1A4t9mcd57UQhz8w0XqtI/A5HPeIwyh0rB1QtIEqn2HRkr+
 1X/UAyAvVzsMY6Kl+rRhcm3Iq1Br4Bo8pTWdK+O7H0GVcD07EiyubKif8CfMj23d0yW+5Gtrj84
 P3tWw046hxsNQmDgqURd+8t2r9qYc9pAPjheMlmmRat9AaWR3wQ3KHTVIRR4Z3ERwYLL8laOclW
 ldVMK5v6r4kdzJ5TjZqaIaIEkEyz1qbAaBAFLD7wdpMFowt6LxzNSYgo0Bifuv4Ig2+mx4vAIUj
 hvzS38tFSOVfpvLaY7UvDrqXefDEVp+dLdreYmr4FST6+bS0CiB1OU06jOioi2zTNZfjAN2EwgA
 UTLqBZ2xh2wNrOyFKAkzkfa/7pA7VZ8GaC3f6FI9qcfZtKSnSTO6w8LzFzW1YhHntTCAf2cf/Ql
 qVTwHDK48HzVnWQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: ERwLp-KZebasUruhRjsK_cpD36xCaafT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3NSBTYWx0ZWRfX1Me0GtONLqfa
 q/3265FqVkYFKLdwMIgte6Dz+hEwgwXm0FSS2gLxTSnRMGZg/iT7gz9AvnRtkQnTxFCHjkw49Le
 IlhSh86Ae4Dtvj+Q6e3CEPi6Zom886/a3NyIg2DOrgXt51J0UxBj9NolJmXw2FrS6mTRGUAL8BC
 OxjtrHVk3qlMM5iks+e+o99AVDyXr2v33c0KYU3K2XRVt9CB01GJyCtFLHUtJ5aTEUfIFLrAfap
 7AWgSz5rr4ps2KyjcU8MCokpPYy9DJPGhU85NKtF8o39CNRrDFJsdpt/q7Dhxb438xj3MoYXd1S
 Yf/sUEqfbY5dJRx1OnTRBOkU0Xq5btkJNyVudvs/Q4+VuSkGPOT9XEpGjbOI2OULibJC+MEr2As
 QGp6GHBH4v1VTIWzCTrGvDa7OzfQ8JYxFZY1gKQynO79iG5pbybpfHrhARDM32Ic0faXTBont+4
 GzRMVsqTmfDscvPwyDA==
X-Proofpoint-ORIG-GUID: ERwLp-KZebasUruhRjsK_cpD36xCaafT
X-Authority-Analysis: v=2.4 cv=ebIwvrEH c=1 sm=1 tr=0 ts=69b7d157 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=lbdJfbWXG8Zdtkr9XfcA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160075
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7361-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,redhat.com,linux-watchdog.org,roeck-us.net,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 78E72297753
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

OF_GPIO is selected automatically on all OF systems. Any symbols it
controls also provide stubs so there's really no reason to select it
explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/staging/media/max96712/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/max96712/Kconfig b/drivers/staging/media/max96712/Kconfig
index 117fadf81bd086cc3e5e95210503000d9e4d8738..93a2d583e90ddb2b797c5167a6d3373836e88126 100644
--- a/drivers/staging/media/max96712/Kconfig
+++ b/drivers/staging/media/max96712/Kconfig
@@ -2,7 +2,6 @@
 config VIDEO_MAX96712
 	tristate "Maxim MAX96712 Quad GMSL2 Deserializer support"
 	depends on I2C
-	depends on OF_GPIO
 	depends on VIDEO_DEV
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API

-- 
2.47.3


