Return-Path: <linux-leds+bounces-7984-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOaaHqG3+Gn1zAIAu9opvQ
	(envelope-from <linux-leds+bounces-7984-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 04 May 2026 17:13:37 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE414C0827
	for <lists+linux-leds@lfdr.de>; Mon, 04 May 2026 17:13:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 28C8030C199C
	for <lists+linux-leds@lfdr.de>; Mon,  4 May 2026 14:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6845D3DE42C;
	Mon,  4 May 2026 14:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i2qVCjG1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="az+hnU1o"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14073DE44C
	for <linux-leds@vger.kernel.org>; Mon,  4 May 2026 14:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777906487; cv=none; b=TIX1rs1SFwL7fcD9Hd1figKMwyXXG/6vxTobSAyLn/gvw+U4+Ll7ZOhEdFJ8h4xq5+OIIB/bSFJzKEiZUXKODohaiUkrm8GDlWR6sf5FyARM6yzTHhRq6B9+fe1iNW7GEO1LI1C43/KSBVxGtBMxmqjR17xWc+/iaaANvq7/jCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777906487; c=relaxed/simple;
	bh=KIjNL7dmqxeCbPL9mR6ns2PckZhLMHsYp6twYA6eS8c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XiVfcS4gtxKoV9Bad5h1/mayH0S19ezPwkMemXWCyl1du0teujTGIPuzY9Y1kbL8lT/bqPytcw0Zeu1CY5Pe44MIVXEuiuM0WedS+lF/F3UkQuPf8UTX9q+fpJR8HwY4LGQb+bcSn1QAer0dp1nVBGNF6wlj89eFf7LcWWVFZwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i2qVCjG1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=az+hnU1o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644Dwbqr3467601
	for <linux-leds@vger.kernel.org>; Mon, 4 May 2026 14:54:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zyWhrMBgTVBnOlZKZUVMGDo1V/gQP9OkQHl
	nvxmUkGM=; b=i2qVCjG1R8peeo1P4PcR4TAbx5U7Ow9dcuqLw0wduWbbm5CRehC
	YVq2mGfcNtVdRwgX4SgdfTTVkddmqJI3Na8AdcU9MRkgqbfyJDG3jKrwSinsh2VJ
	To1N48d31I8rrJYfXvqpeJ1MECnjt4NKTbk0O4PS/BYVGLjT/wrAkUAhqhiz+coE
	xuQqzwu6c6u00Ko4tk8ZxBe/exDp+uFvlAstXNA7MKYYhuRbtjjTBth1d4zUlyE7
	GjiVqA//c5ax7wndL27GTrNj7wr7PaP3RJIfGWbeHeCrnUnDryJaZnrlIx0sBGlW
	01XRnbI5aU+YjEugk7FhvUw9dOJaNlMkZIg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvtjr7us-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Mon, 04 May 2026 14:54:45 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5738ad13968so9713082e0c.3
        for <linux-leds@vger.kernel.org>; Mon, 04 May 2026 07:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777906484; x=1778511284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zyWhrMBgTVBnOlZKZUVMGDo1V/gQP9OkQHlnvxmUkGM=;
        b=az+hnU1ocLr+HvKtbdHgnWOVPX4bAMOnJ6BbgzEeqYXsWQQeJRQK9KkObaKK+EI705
         JfXPqsr8minnOst/cNKw6GgR8i7+mQx8Be9tdBf1BN668dI+GAzVpb1ooBT7WWymh+CM
         qPnO4V4q0IdVIC+gjK/6qPq8APZhkI1MskbNjW2QZpR4wU3vTXUZLNljMOO/GD7ykh7A
         tzrdV1FVcdVxT8QUMetUN8YWU8c4qM5dA1C53+L1sgAGrNNMLNB1OFyWIAfvog1rIDcm
         hbH3EfkCt9DAmrlaiyY0QbxABHYIbYHgwF3EZLG+Icqk6wW1tUWecxvBGF2WY+dF1Nxx
         /2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777906484; x=1778511284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zyWhrMBgTVBnOlZKZUVMGDo1V/gQP9OkQHlnvxmUkGM=;
        b=D9anJYRq9l6miBdfppyL9wEBLTb3A7/vF0vxR7c84GMZGPlnXeczBaIAoJHQqub/af
         PC9dqEtSSz1CFO/fADFeVpahSgWPhpzZRB9mcIFcFp6FKbk19jcZVxEAuoagul22FM+O
         eIYwN8jL2Y2PU0ucslPqNBysG/S3UKjM5Hsin+empeygDPk5sI5l8sb2mdHv2/zr5ijM
         DnRNN/4UESYTHI3w9dhM6MdxunJOJLpMysLysJGUrpTtkjqhVGcmpi/H1JGGx7d2qN4v
         qdP/GNZNK1oPfyAj/gPk2hpHsZ7/hLTUsTtFopHhnK4h8Zb6nBhnCHsnWJDmDZpqGdoN
         l7oA==
X-Forwarded-Encrypted: i=1; AFNElJ9M8kS9QEZsIyCslJnqtED5yyqf/598bTV8UPfpweMwfTfUtBdIblwwP2vbOOO2kvojd1t7Q+PVSIaG@vger.kernel.org
X-Gm-Message-State: AOJu0YyC15BK9+e8HnI2mQL2iSwv55i1hiyWaVDblgFEbzIj9o4MjCxa
	0tu3phUfslcikYAiYO0wB28L2jRV7pT37XKYVUlZ96oZFVwiOmzf0lBAhBESXhIzf5mfmhuNUWa
	wptVN/HGrRslR7P8NAP1MtDaa0HVnphERfJO0mTvYeWN3LsFLJ98Thtkr+CSEZ6oP
X-Gm-Gg: AeBDietEKyvXC5Kw2tqKni8zC76y+6GB5AymoHeEOXFncrhhecyr93pUEtMR0tQQW5t
	OYv9OC3y0R+6JYPRHus/emLg7NNjxsJZQIr3LvvbAFjx70SoNOsCSpNSG/NUJDcSjMB1zABrz9B
	TmXtKMD7zUQHn/LTxMNHODUcq0OqH/fnRCrixpEEGb9b2aTzC8cly/0h6MmcF+IwaPz/TSk0xqc
	cisZ11vvw0lzptXRziEaB7fc7if4KHoTKU7L0N2GfG2O2V+D0iHRKOtP0VHHYAxc6tcf89MNxaS
	CTTKg/u1+FsL80GDxx+JPz1re8F7RZLejU2iNqQ0PqR9LLf4R2kzEqFE0FW3jcjPOm2RKphztZr
	865iK+SwhZ0QAxdzxP2349zMGLXuxL1GnlLTSGA==
X-Received: by 2002:a05:6122:458c:b0:56c:fe16:f54b with SMTP id 71dfb90a1353d-5750c654b1bmr4498675e0c.11.1777906483938;
        Mon, 04 May 2026 07:54:43 -0700 (PDT)
X-Received: by 2002:a05:6122:458c:b0:56c:fe16:f54b with SMTP id 71dfb90a1353d-5750c654b1bmr4498656e0c.11.1777906483495;
        Mon, 04 May 2026 07:54:43 -0700 (PDT)
Received: from t14s ([109.36.135.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc19bbb1fc7sm160704966b.47.2026.05.04.07.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 07:54:42 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Rishit Bansal <rishitbansal0@gmail.com>,
        Carlos Ferreira <carlosmiguelferreira.2003@gmail.com>,
        Edip Hazuri <edip@medip.dev>,
        =?UTF-8?q?Mustafa=20Ek=C5=9Fi?= <mustafa.eskieksi@gmail.com>,
        Xavier Bestel <xav@bes.tel>, linux-doc@vger.kernel.org,
        linux-leds@vger.kernel.org, Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v2] Documentation: leds: leds-class: Document keyboard backlight LED class naming
Date: Mon,  4 May 2026 16:54:34 +0200
Message-ID: <20260504145434.12746-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: G-nFraKrbF-QV43tH-GucYQ6fHTRwL1W
X-Authority-Analysis: v=2.4 cv=KuN9H2WN c=1 sm=1 tr=0 ts=69f8b335 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=42ONuYLmbm3caH2S/eEC+Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=BbKpnyccwsDoZckoJYIA:9
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE1MSBTYWx0ZWRfX1YBooRYIJOrD
 D4equkER/nRk3mkQYU84+Wg4nekhiokZkc7QzOYfrFrrFlzoXa5NYOZ5QpSyEYGLYhy4CJSViQ4
 36TkfayqFI723woK26/3PyTPHdk5QWf2GJQRPV9KdOgBsfv96I3WC3y7s/WVjGkxkT+eL3nJjqe
 kUPwYPACoSsc3IKYHgoA/MAs9lCUI4n7YUhf+iDr3p7uYqDUox2wsIn1aLp0A1MJj93KX9pINDN
 0sRzy6fo/l8auxUYD4z42gyy/DEopLyEus3TuchNLaBxQ0PHSrFigYXutleIguKB+bTaVsPdgUU
 RMgLZ5h5Z+fRBAW4oPjbVCMaFyFbM7A+ZJj3EC64BGYXYDcdLMjLMhPu+DHMPutv2IOwTjJvLaD
 W3r4JT7mI241hZKMTKrRVNWCvg9u/4oIPL7P6QVhZZW2bv6MCHM2Ls6JfyDYMgdbQ1QxdJc/Csq
 O7Q7a62XB9QAPLqxR6A==
X-Proofpoint-ORIG-GUID: G-nFraKrbF-QV43tH-GucYQ6fHTRwL1W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040151
X-Rspamd-Queue-Id: 6BE414C0827
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gmail.com,medip.dev,bes.tel,vger.kernel.org,redhat.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7984-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-leds];
	NEURAL_HAM(-0.00)[-0.997];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Carlos Ferreira <carlosmiguelferreira.2003@gmail.com>

Document the existing practice of always using 'kbd_backlight' for
the function part of LED class device names for LED class devices which
control single-zone keyboard backlights.

Also extend this existing practice with a new naming scheme for keyboards
with zoned backlight control. There are several drivers in the works (see
the Link:tags below) which offer backlight control for keyboards where
the keyboard backlight is divided in a limited number of zones, e.g.
"main", "cursor" and "numpad" zones.

It is important to agree on a consistent naming scheme for these now,
so that userspace can support multiple different models / vendors through
a single unified naming scheme.

Link: https://lore.kernel.org/platform-driver-x86/20230131235027.36304-1-rishitbansal0@gmail.com/
Link: https://lore.kernel.org/platform-driver-x86/20240719100011.16656-1-carlosmiguelferreira.2003@gmail.com/
Link: https://lore.kernel.org/platform-driver-x86/20260304105831.119349-3-edip@medip.dev/
Link: https://lore.kernel.org/platform-driver-x86/20240806205001.191551-2-mustafa.eskieksi@gmail.com/
Link: https://lore.kernel.org/linux-input/20260402075239.3829699-1-xav@bes.tel/
Acked-by: Kate Hsuan <hpa@redhat.com>
Signed-off-by: Carlos Ferreira <carlosmiguelferreira.2003@gmail.com>
Co-developed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v2:
- s/compatiblity/compatibility/
---
 Documentation/leds/leds-class.rst | 63 +++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/Documentation/leds/leds-class.rst b/Documentation/leds/leds-class.rst
index 5db620ed27aa..3913966cfdac 100644
--- a/Documentation/leds/leds-class.rst
+++ b/Documentation/leds/leds-class.rst
@@ -116,6 +116,69 @@ above leaves scope for further attributes should they be needed. If sections
 of the name don't apply, just leave that section blank.
 
 
+Keyboard backlight control LED Device Naming
+============================================
+
+For backlit keyboards with a single brightness / color settings a single
+(multicolor) LED class device should be used to allow userspace to change
+the backlight brightness (and if possible the color). This LED class device
+must use "kbd_backlight" for the function part of the LED class device name.
+IOW the name must end with ":kbd_backlight".
+
+For backlit keyboards with multiple control zones, one (multicolor) LED class
+device should be used per zone. These LED class devices' name must follow:
+
+	"<devicename>:<color>:kbd_zoned_backlight-<zone_name>"
+
+and <devicename> must be the same for all zones of the same keyboard.
+
+<zone_name> should be descriptive of which part of the keyboard backlight
+the zone covers and should be suitable for userspace to show to an end user
+in an UI for controlling the zones.
+
+Where possible <zone_name> should be a value already used by other
+zoned keyboards with a similar or identical zone layout, e.g.:
+
+<devicename>:<color>:kbd_zoned_backlight-right
+<devicename>:<color>:kbd_zoned_backlight-middle
+<devicename>:<color>:kbd_zoned_backlight-left
+<devicename>:<color>:kbd_zoned_backlight-corners
+<devicename>:<color>:kbd_zoned_backlight-wasd
+
+or:
+
+<devicename>:<color>:kbd_zoned_backlight-main
+<devicename>:<color>:kbd_zoned_backlight-cursor
+<devicename>:<color>:kbd_zoned_backlight-numpad
+<devicename>:<color>:kbd_zoned_backlight-corners
+<devicename>:<color>:kbd_zoned_backlight-wasd
+
+Note that this is intended for keyboards with a limited number of zones,
+keyboards with per key addressable backlighting must not use LED class devices
+since the sysfs API is not suitable for rapidly change multiple LEDs in one
+"commit" as is necessary to do animations / special effects on such keyboards.
+
+An exception to the rule that all zones must follow:
+
+	"<devicename>:<color>:kbd_zoned_backlight-<zone_name>"
+
+is made for the special case where there is a single big zone which controls
+the backlighting of almost all of the keyboard and there are some small areas
+with separate control, like just the 4 cursor keys, or the WASD keys. In this
+case the main zone should use 'kbd_backlight' for the function part of the name
+for compatibility with (older) userspace code which is not aware of
+the "kbd_zoned_backlight-<zone_name>" function naming scheme.
+
+While the smaller zones should use the new zoned naming scheme. Such a setup
+would result in e.g.:
+
+<devicename>:<color>:kbd_backlight
+<devicename>:<color>:kbd_zoned_backlight-wasd
+
+"kbd_zoned_backlight-<zone_name>" aware userspace should be aware of this
+exception and check for a main zone with a "kbd_backlight" function-name.
+
+
 Brightness setting API
 ======================
 
-- 
2.54.0


