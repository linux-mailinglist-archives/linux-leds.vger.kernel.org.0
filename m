Return-Path: <linux-leds+bounces-7362-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKLzJsnUt2n0VgEAu9opvQ
	(envelope-from <linux-leds+bounces-7362-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 16 Mar 2026 11:00:41 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DA5297945
	for <lists+linux-leds@lfdr.de>; Mon, 16 Mar 2026 11:00:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 93AA83074EFE
	for <lists+linux-leds@lfdr.de>; Mon, 16 Mar 2026 09:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E7703932D5;
	Mon, 16 Mar 2026 09:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MmRWhV8p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IIlDKoq4"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40559392C57
	for <linux-leds@vger.kernel.org>; Mon, 16 Mar 2026 09:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773654364; cv=none; b=CsMF9HtyIZxVkvXuYPVkWrXKW323nyobRE1WEUEv0oAST3xtUv+Fk7msQqTFSa6v5DRNJIjCIG9VNq71QeszX8qayFY9q5gez+1Uur7r8Z/2ZIwdztKB5HnaeR4cHw1lnHKgJKTgTqP1p37EUEArS9KfjMPXOaGQh9XRl0HbB0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773654364; c=relaxed/simple;
	bh=N/KccnxICgrK3rI/2fd0AqdTwq45Oh63UAkAjH8PkgY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RJpjxZ6Bk+oGR/2rbQ4D1qo5nbEcPBrFm8PfWmTxN5atUQJkD3vrsEvxNDQqVD6Y71QhObnnzjfS/2TU0vWLny93BSbPNIfCNmBl5dFUBM8JTgL5l/KfJWCeAe1hOwTaizvPCuX64fwTzZHGtKb1Na+hAAn+cinX+eNZmprC2Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MmRWhV8p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IIlDKoq4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G65FGR2584676
	for <linux-leds@vger.kernel.org>; Mon, 16 Mar 2026 09:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HvHWdMGL2qhQtG+yXiw7hgmpA7lCBBYNzpbwEI5vSeI=; b=MmRWhV8pxvq6yPAM
	Yg5E1WSc+BeQb4tX+XvJ2iUF3BjbIcU0ZH5WZLOgUYzAYRw/7eeCdhMbin4qtwWh
	FchyrhgzJ+vAGzFhWchYm7iXBPYgZCUgKcoV0dRKlibhTWrrrWrtiNvgo5KmeefG
	VyWfmOrp0y9G8UxLUetK4NviyuVlCozyEXASZgn6F0/SbZpHTJ0kB7KSGd/Nj2sd
	f+8xePkvt3dAR3HVM6WGKN6ZiMAKk+hazqGJYmUxIcbnwW8dctw1bI0zs3OfOxPh
	adpbDRI40qYCMnj/kEJEL01743iHjrrMuxU41dAps/QAazGcbWS13bGGXTwOPdTC
	X8ElmQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0ecd091-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Mon, 16 Mar 2026 09:46:02 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89c4ec516e5so160747666d6.0
        for <linux-leds@vger.kernel.org>; Mon, 16 Mar 2026 02:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773654361; x=1774259161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HvHWdMGL2qhQtG+yXiw7hgmpA7lCBBYNzpbwEI5vSeI=;
        b=IIlDKoq45Q52DgpC5tJOGkOVPd1MdgHiA6nLJP6f0pltP6RTVcXQab/y59WtKCplby
         SL4nAybqg+VW8iHCO2yAN2XLMzRxUylTnji/2Fg6ELYZ1BME9u8rIj1veNoi0b5xsLeu
         cB4uk8rjSD1kq3h9XVxbUFRXGmx90+q5YI8BC48JqiPGnxYmY4XU/guBa24FPdU2pULK
         yAj3Etq6WPy5IxwUnA9krb7joUCjQwU+WXStc6/p0aAMnUpfA3wNZkb0mwICkkAGJDLw
         wtOAoeCq7TS+X8E4nuPVk5d62wrk/rbfjRrOXIbE+nlg/fyqqX9FhGa7ZYdSPIzzFxCS
         wfvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773654361; x=1774259161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HvHWdMGL2qhQtG+yXiw7hgmpA7lCBBYNzpbwEI5vSeI=;
        b=YfX0fRENXU+/GaDWcqu+t0l8Mc83HFcu+wIs7mvRcCVt9i4ZhfkLPkKSMaiNr39DBN
         HB3a7q4qEeKSNh2lOTATr0khvJdouSSDR36QrzrZ1tiGLN55V8JCikQQPCt7x9jk7Ro7
         mT4aDnSbI+Mg1lscmeYztQn1PC1G1hNU89KtNqwblDr2zgzu9tNmbBkoObt3fxNlZHXc
         8gWykVUYNr3cyiON6XN3MeFF2llSwncSIecigXCepgx6hMEhDAqdjeoQvELR+iIs9mdd
         WPk0/t3GKZTSCWqi5dHuHsx1lamE4w9Nu07udTGxcbMV7+rNs1WouxMCmmeY6cj4hycS
         aAlg==
X-Forwarded-Encrypted: i=1; AJvYcCXL71w0nGZbiTDq3LBHhVGmTwJgavGQi9n4gV3pilToRRGbOlNSA23J+TgSykRb+rMCDpUEd3OYcCgK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz++07V2Mfrivg26OBtFgbknoTUarMOfusmhDR8zcGYy73fSJYh
	m7rlbG1Aa4xmhZtAqq0DhyF8QypFdOJOLrhkn9C+3fhu5+an09mLcPiBDCBftg6PNyCdD5f3abU
	nT9JbihjyLTyFuHVO58bVRVI9+HZAhgp733yyqHMzTt+uzXN6lFIU0kCtmEzJ8PRB
X-Gm-Gg: ATEYQzxEW96z2URR/DISGtHCXMju5+xVX2YypZZJ4/6n2o7KVGkc6tmd6i4pKrDMdmu
	m4mkit5aBWWhPQTRScRKikSu7Tq6Is71vzcBXFzi02tWTtyJ4ZEj6Ingapxj5GI4W4jw7tzNXZS
	93BMqyGUPk3KYkEKjtcNrWqjS7tr+0I4TQZXLJe9d/St5QhGSFpf+z2kwY8HeBh4ojofJYvQ9Rf
	pwsuBgiIZzufc+HpNK7L1DfV6W+slGfA3PYirKSPWt67XDqsT/pTvmwnLbVlmyRMyAmpj3mmm3X
	f26E/vY7i7EgjGcmJw3O37r4kI+ge5xC8BEoAW9YvFCNjUC5ZXflrtWZft5HQ97sisRHDWmRdYP
	rvDWuX4b6pXf3PDQPOlsPCfLD7ozfbWlBxkYB22p0KMsb1O0mWCTJ
X-Received: by 2002:a05:620a:2549:b0:8cd:8f18:d1f4 with SMTP id af79cd13be357-8cdb5a4abf2mr1564739885a.6.1773654361436;
        Mon, 16 Mar 2026 02:46:01 -0700 (PDT)
X-Received: by 2002:a05:620a:2549:b0:8cd:8f18:d1f4 with SMTP id af79cd13be357-8cdb5a4abf2mr1564736685a.6.1773654360971;
        Mon, 16 Mar 2026 02:46:00 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:ba9e:e504:fb0b:f1f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ab9f9esm503138755e9.4.2026.03.16.02.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:45:59 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:45:28 +0100
Subject: [PATCH v2 8/9] power: reset: drop unneeded dependencies on OF_GPIO
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-gpio-of-kconfig-v2-8-de2f4b00a0e4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1970;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=N/KccnxICgrK3rI/2fd0AqdTwq45Oh63UAkAjH8PkgY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt9FBUPuNGhiF3uPrD3MLEpw265O2ryCfQa0A0
 3Zj48AI/n2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfRQQAKCRAFnS7L/zaE
 w/O9EAChOyuMMoMQSI3Z2l1Ai1DTeM7NVpOttafe54EyetzU0xw8PjsPlMgISx0CWvQ0gahGXVq
 fw++E21GJiYXzpJ3b2aqPC7+zX+2H5Y5orVnw/nRobgzElec6gqJpUSmgt1YDLvxp0PtuPSm6Ya
 A4iXITqLKjd0udPk2gaJGei2UMy6fkjfX6uyNSO3TGmBLquvyFRSevreObYkrywIO+V8vgMiMpa
 wZpzyJZe7cDpXUdQRXxelUAxN0B3TcO/io+SOISUGGzvRwiGpfQQcGSjttrm6om3sHQdwjdIMyV
 toCf80JzUY2N7Ki13DRxjZVnCAOFIXuD2K59YObtzbB9iqtXojbGl+NFNYXRpjhlk7+LOdFCwVt
 Ys9JHWGMBrCk1t9+CpAgigQ1LbMxDP9+5EC1frWy4rS7uBZlOEaozyHrRn6q1i4NhSgPKlIFqU6
 E4Qs06xlH4ks+yPLrcLn5D7P1nGkri8AAIFhOWNYP5POm11KHxerWB02ZbqkwkvkUjLIkumX0wH
 xegWOZOlRuSPp2wPqnVW8WZQqOh3OPUOPIcPnt/UxPvPlLXsz/MvVFadH4CmLG7UVcsD81jpgk8
 L60flzwaTd17bTl5BJJTYa4ZBOk1876I9o7jppj4M2qDWpFv/RRgVGA/71+FMt4JBE9UpRcNRD8
 Kfg2tDgl4ySflcw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: CrUrs0O1OECW6d7VU9aM9V3TdbJEvhDe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3NSBTYWx0ZWRfXyz8QwqYaLbsu
 UWfsFTIuxkZcBiIhTwpqfpvuFIJD8dAxQcLNy6USI5s3f3eSFMZzfqNbRVoctPKWDWp0Ib3HElW
 hXMoqdCiygPTXF1IRV805Q6ouTFVqrSP/3s3KpjFZvjrLgHyQMYymTaipBu8tFBygDGop89U1O7
 5+0z1nf3iQyKUSuezKyNhieQOAqpWIaouO4Yr8jV7AKvUOnrLwB9aPi0CuIeWlukCXpdn1PxgOb
 keIwBW96+Ib8a56gnrBEF3bSYd4M370HrIWAmqxSbcqBZ+JcqkKlgyBg1Nkc35Pe63u7xT/Nmp6
 C5uRIMJlQh7LDoPfVLX9sJ5GjRgxtKu0UwuAjtEzi6bfMUcTDX6kdK3tCHE1+JxOH850tbHFPba
 ssFIFI3LYoG4sAH6aYrWf2x5E+Exdikw1gb05yveHCavNB1sRpXCTvQcGCPKv3juCH4q3riP49f
 StWIclGCAD9XbJAF0pA==
X-Proofpoint-ORIG-GUID: CrUrs0O1OECW6d7VU9aM9V3TdbJEvhDe
X-Authority-Analysis: v=2.4 cv=BqqQAIX5 c=1 sm=1 tr=0 ts=69b7d15a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=esZZGTiVAK7d0sqnEIwA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160075
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7362-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,redhat.com,linux-watchdog.org,roeck-us.net,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A1DA5297945
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

OF_GPIO is selected automatically on all OF systems. Any symbols it
controls also provide stubs so there's really no reason to select it
explicitly. For Kconfig entries that have no other dependencies: convert
it to requiring OF to avoid new symbols popping up for everyone in make
config, for others just drop it altogether.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/power/reset/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index f6c1bcbb57deff3568d6b1b326454add3b3bbf06..8af398b4e6f7fc5f2ecd92f11d03c43cdefe1ab6 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -97,7 +97,7 @@ config POWER_RESET_GEMINI_POWEROFF
 
 config POWER_RESET_GPIO
 	bool "GPIO power-off driver"
-	depends on OF_GPIO
+	depends on OF
 	help
 	  This driver supports turning off your board via a GPIO line.
 	  If your board needs a GPIO high/low to power down, say Y and
@@ -105,7 +105,7 @@ config POWER_RESET_GPIO
 
 config POWER_RESET_GPIO_RESTART
 	bool "GPIO restart driver"
-	depends on OF_GPIO
+	depends on OF
 	help
 	  This driver supports restarting your board via a GPIO line.
 	  If your board needs a GPIO high/low to restart, say Y and
@@ -181,7 +181,7 @@ config POWER_RESET_PIIX4_POWEROFF
 
 config POWER_RESET_LTC2952
 	bool "LTC2952 PowerPath power-off driver"
-	depends on OF_GPIO
+	depends on OF
 	help
 	  This driver supports an external powerdown trigger and board power
 	  down via the LTC2952. Bindings are made in the device tree.
@@ -198,7 +198,7 @@ config POWER_RESET_MT6323
 
 config POWER_RESET_QNAP
 	bool "QNAP power-off driver"
-	depends on OF_GPIO && PLAT_ORION
+	depends on PLAT_ORION
 	help
 	  This driver supports turning off QNAP NAS devices by sending
 	  commands to the microcontroller which controls the main power.

-- 
2.47.3


