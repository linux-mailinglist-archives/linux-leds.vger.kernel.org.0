Return-Path: <linux-leds+bounces-7359-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4A1UJ//Rt2n0VgEAu9opvQ
	(envelope-from <linux-leds+bounces-7359-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 16 Mar 2026 10:48:47 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCE2297598
	for <lists+linux-leds@lfdr.de>; Mon, 16 Mar 2026 10:48:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F2E923029AA5
	for <lists+linux-leds@lfdr.de>; Mon, 16 Mar 2026 09:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80DC1390CB8;
	Mon, 16 Mar 2026 09:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ah6jhUXp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dIGSgYyt"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73093909B4
	for <linux-leds@vger.kernel.org>; Mon, 16 Mar 2026 09:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773654356; cv=none; b=Mat+hZmiE0X/3rqFToDWPjdo5XFqDaV+4/tTbs62wbJt0ynVtSGi5NKZVvyrCXxlT7FVLsPc3/Lm2ONq4xrWSaRtUM2mjpo1BsUW1A7HOZOxSb5r822JRNH1gCjCqbC+sEzXQSh4CXZTSQwXK6vd/dUMpP7q4WQW95mRl0U9Jzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773654356; c=relaxed/simple;
	bh=zJiRRZHOn7YqYQ+LwAzSJIAhBCW3qgcwJUw7el36TcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a5GYdpGl6VSYCIS5BHdL/CLfHGKOzPXzd5cG5srNPZUxwssG/zd1258WEIoSPdilFsTgKPdsk6Rh1cGJcupJpY8uApF4uJQ3qNdlZEHEOQVlT3MDxYwxCj1t6szrC3yQWXOacONu0cePx++Qma9a/U68QBMEeBGEV0n7NX5YTG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ah6jhUXp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dIGSgYyt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64f9K1282129
	for <linux-leds@vger.kernel.org>; Mon, 16 Mar 2026 09:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V77ZeRO5gkyRLxJmGfiVvPBzaaSm4qWfHkN94gbvCVQ=; b=Ah6jhUXpoBakze2y
	2w8SGxWQtyIX1qayUBDXigwddz8W/9QJhjLlUh0bV3q18J80OrfPQMFWSdfoGXGK
	Qq+AVFJJUFKI/dIkiFwNpqLSh9yBZ46GlXE7CP7SeHZ2e/aLjXodfZorqDK5nRPf
	OuA85HORY8DDw3pzGERKU26bAV9rzBW8eKmq6Q8+CQMYf6KKb7KnuWRGHT6llzy0
	MRWGzlwyQbJC2SYHpN97KCRd+NgvsnIPQim1aXWSOCoqdF052iOQaMGxU4W/gpqX
	qoBAsxcuRca9afQbM32Nec2Ro1LaXlML3mqQOHfb10aznyfePYELWQ5VIGmGpaOk
	Rig9RA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyyc50tq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Mon, 16 Mar 2026 09:45:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd83cfb36cso1177237785a.3
        for <linux-leds@vger.kernel.org>; Mon, 16 Mar 2026 02:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773654353; x=1774259153; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V77ZeRO5gkyRLxJmGfiVvPBzaaSm4qWfHkN94gbvCVQ=;
        b=dIGSgYytIRfVS0iwzabuXeyCJKcZFtDWjdWTsb+8m+JYx9eADOaqwi8TkGo05wM77f
         Z4XX+o2kjU5ZRoovKAse93YOG/PBV7CY+Sm1YfMeD9+t4vNzCwDZDhY440pba7jYfBD3
         BNsh2WlfSO3fZfrDydTrsCLU2xeiDDLce1tGPkJl5uP+c9/cMi2QeWG0INjWnk5/2CMD
         GHFGtVvsTNZ/RUaipTc8AeEH1Bk7bm0B3yjgSKYcgGANXdjSjuTvXhbSBVLFTFAn8dN9
         954gR4WIqqY32bAiEpMDE17enOR5SMn+OafmICOIt64hPnkf5pQxRsXW/qVBat5ufxgG
         EeiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773654353; x=1774259153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V77ZeRO5gkyRLxJmGfiVvPBzaaSm4qWfHkN94gbvCVQ=;
        b=dQ8+oABkZobjIArrnGhA7xYfViCy1huUVjamsnolKtty+VEkrSrUrIPyy4q9HjhgxQ
         I8qXUbbNjMzSqQJym2s7Q6VtFNH4UcUqNocsJ4BX7uT1W9BxW0VqehXl0nJp+EefvWBL
         Re9KI5BATtWkVg/fcsYrpv1B8ljvUZOo+aW5pfKDBP+tu650pVVJaSr7q0yX5cNO01kf
         PIwLCuyNzzr1RHkAAS9J3o4JF/7QpQWmziMmCYSPFrv0zhq8JoQZcmyBYUdfp+c0su/C
         lkEBTJLVMq83Q1ZcsaNvEyY35/Fuw4IU1eI48+GjxMJ+oxxoVUOYe4GqOcwCNtGkssNX
         sIVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWC/x9M5N93KAtU13cpc+MekAQ4aRSOvUuIKfqzC0xSEfH1S+T0bLCfkmlxeYMtbcP0l7KUIZqGK/yh@vger.kernel.org
X-Gm-Message-State: AOJu0YwHarQdPoPpjzZYhCz7E8nji21MEimrxumhNS7pLTgpWPXy+Goc
	s+8UDs0wGYMTC4TOBLwbRhHfQCt5uoUeIB+hqyropWZ5TavhtS0Oura+IZnQxSocJQpkahSLRtm
	I2t1e9jF2RqMHtjHmQe27Px3ORne9JXYh/eI22TbwjGtxuBnk2lelugdjpoWyeRyc
X-Gm-Gg: ATEYQzwnvPcEwamGHtCSXEJKV7bHJstgaHhJ37QmfSbb8OqoV/mpheT0JbFK7uO85LP
	PgBA7JHY6/O0Hj70Eaq1u6jrBXc3/BxF2yxuqhM7e7/bn3wcz4tIGtu3EFU77x7X2Lth9F4IKLv
	pvzewzf7e3N0IdXUtOGVOPz8TIwQC04Nf8XIDg9s48b3i0+eSglX2UNbadF930rSAn3iXuZDg3X
	ewPeuZ0veGHqJ2bSvPLgmDodOGasQYgSmMqiBUUrSShau3v6CrvkJhPfBMSuPy5GC2EXP71XojV
	zCpF/fjYdb8NqGukH5ctfFeyJrXef+Bebw096bzpBtVEWummIo4mWflm7SNqYUMLVk6ZTzEBUcI
	4kiuaue09f9XKKgb0RrITo6sRYpGYmwWx0x0c0HR1SAYbalFxXw5c
X-Received: by 2002:a05:620a:4044:b0:8cd:8447:2438 with SMTP id af79cd13be357-8cdb5ac4741mr1453871885a.36.1773654353311;
        Mon, 16 Mar 2026 02:45:53 -0700 (PDT)
X-Received: by 2002:a05:620a:4044:b0:8cd:8447:2438 with SMTP id af79cd13be357-8cdb5ac4741mr1453868485a.36.1773654352832;
        Mon, 16 Mar 2026 02:45:52 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:ba9e:e504:fb0b:f1f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ab9f9esm503138755e9.4.2026.03.16.02.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:45:51 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:45:25 +0100
Subject: [PATCH v2 5/9] watchdog: convert the Kconfig dependency on OF_GPIO
 to OF
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-gpio-of-kconfig-v2-5-de2f4b00a0e4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zJiRRZHOn7YqYQ+LwAzSJIAhBCW3qgcwJUw7el36TcQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt9E9Wjg25U44jwuhf3siwRv6gc1FrTGrZYCag
 DWx38GqUKiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfRPQAKCRAFnS7L/zaE
 w8FnEACjGpR8zaC1w1NeBaLCJvktzj4NhYyW2Td8DUd/H42BEdQFLueq4ukzXtCUXnHdHSdYlxX
 5u85kdqwdApTbieFxlcUadqplP0P27zARAEwj8BjR6bXmDtxbyL9zA5AskPF15evHuAhtsb0vLp
 rWJ/hPriZFRMOTvoiz306zGosgjHeo5b7IFdBRXQKj9pWZu9KC+6nj5Dde/Ek3mIsw7+7RlR+uL
 QLlJnoVNjOKlMMbwrMF8wLuyGxcetuCLacwTtrAUIPDb8Wvg+XSlQ61HFsVAI+6edYFrdWNBKZO
 qAuA/aWE+2oLqr2TcjOEd9gTRLahdebgddcpyr3CudMSPfCe0ZsfO7omWEYO+mh4eu4gObaIOFi
 rSbIFdwsXpTDZyGm8d1I5QasUJ3+T+m5Xxx3yz/Xnw5U+5ch1XQ2oj8rtwYXR4/xPwKE+PhAyev
 EfAmjkak0AwcGfVxvGVwN2Hsn+3MujSJYtzJKGNWR7FqZcI4vanexFwbfhQUBEab+O3yPbi9B8A
 /L20/ccFo1EBkUthx1vFD1wCRe5aIuUQ6rQ3XskhBK7QPd07CNiGavrvpP18ZsC13Tt+iPg8Gd3
 9cZ+OAZ9R7FbhBlqGEwWzhdvmPW/KCw3MbJmuyMjozO0JiauqgeMASM0B722UCBXMoO1nFINRbo
 DDxY+Xizi+tKYMw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=euXSD4pX c=1 sm=1 tr=0 ts=69b7d152 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=_jlGtV7tAAAA:8
 a=EUspDBNiAAAA:8 a=KiQ1yeRyPa_UOXqLYlIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-GUID: mGDLHctl4lq3i78nBbBnqNZCd68R4-w8
X-Proofpoint-ORIG-GUID: mGDLHctl4lq3i78nBbBnqNZCd68R4-w8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3NSBTYWx0ZWRfX7L2VF7NEjv8I
 XUbsu6pfjqQvj28nfSTZEecmxV53ufEK3Pyz6lJHYQWVGpP791u9PFzK6nfZE+LKSDisN+xcXyN
 3DU1vFEX0COw+g/9fyg5zfTOwZCQ0H3dByZ5nvOvlZ9tuPPdiLLCr6G29wPGerSsLqI8yctEWye
 GonC+Xol1xyYt0jOnLlvEgztmrJNcb9sVxD48N6AMJUDajtY6shor1L55+EnAZpWJetiYd5+J1s
 pdkXEOVx8IDCpdHivdI4LYxO4xgj0RE/SaI5NTG6QqHIICci/6vcfBbMzwuQDoZyHWA4w51XbR+
 CXijVSs1joLZ+29ovm3WYKQii/p4Lx25VwRFfNBNqEtU6GI+hlx2QHj4XYdtUiB6VsG4V5T+GPW
 VrjkPc188ea1VGAS64QwN/FVYHOzLr6qHUbLY4sppzmmlFTX1Q9KwlBe/NG7PIbxhOXlZTsChSw
 Vp8YTzjvzq4fmvYvlAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160075
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7359-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,redhat.com,linux-watchdog.org,roeck-us.net,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5BCE2297598
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

OF_GPIO is selected automatically on all OF systems. Any symbols it
controls also provide stubs so there's really no reason to select it
explicitly. We could simply remove the dependency but in order to avoid
a new symbol popping up for everyone in make config - just convert it to
requiring CONFIG_OF.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/watchdog/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index dc78729ba2a5d6e035ed3cbe5c2b631d11b76b20..ab1d5d6df5f32f084c893a7af54d040082a3b6f3 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -250,7 +250,7 @@ config DA9062_WATCHDOG
 
 config GPIO_WATCHDOG
 	tristate "Watchdog device controlled through GPIO-line"
-	depends on OF_GPIO
+	depends on OF && GPIOLIB
 	select WATCHDOG_CORE
 	help
 	  If you say yes here you get support for watchdog device

-- 
2.47.3


