Return-Path: <linux-leds+bounces-6950-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJr9F975kmlx0gEAu9opvQ
	(envelope-from <linux-leds+bounces-6950-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 16 Feb 2026 12:05:02 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4CC142A46
	for <lists+linux-leds@lfdr.de>; Mon, 16 Feb 2026 12:05:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BDCD0300159C
	for <lists+linux-leds@lfdr.de>; Mon, 16 Feb 2026 11:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7248A276050;
	Mon, 16 Feb 2026 11:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JtIunRts";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aWnkHhTy"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498F82472A6
	for <linux-leds@vger.kernel.org>; Mon, 16 Feb 2026 11:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771239888; cv=none; b=rbLcfHqSEIJvcmdI6kxaapk2vLOku6UnmrCNiti2HWaXOKa4S249QYfwR6GBG0JWzqDnK2orxAv6tGhziwUmLYIDK4mhsz/MUaqWvfeOsEY7mb3uzOp2ma/cMm9TjV5oXE2/RnqUd6nfe6Gl4DW80pzSsDNvBL3M7uNqZAHAL1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771239888; c=relaxed/simple;
	bh=IojXgkbf/qVR+mEiPG55DitQ1haq8Tu82cJsmtqwOMw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CbF8Ui+QQZ4BOGLTjg6biGuWkV9U7D2BaTjjsyZo/DkomxlE202t/fICd8WNcyaMMjrt2MUQURFXX/pHVnYwBjNL4aSSOby+2AOMvdtQXM2HOOkvipQ4/3mUBh/lyxuzeSvWw0HqXQdxccH2pvI5wpdPSqkNhHp9smyag/+YNNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JtIunRts; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aWnkHhTy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GAQ8Xw2654046
	for <linux-leds@vger.kernel.org>; Mon, 16 Feb 2026 11:04:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Q0/8HLHKTMuvxrvPr5krz/RHUrMsQYb9h+0
	RcCpClv8=; b=JtIunRtsK7NfRkweZrij2Brb706SDdL7ZZanVXebYymGkhDYPQp
	Ac+UK+OiEdWB59xr0VzifBJi+EPV5/6OUPq/qiqkyllkbAoXK5kjQFvhIhxIJ/YX
	vqzDlYkRIXAOd5wyTt1ZxDiUcyv6Y93Gy1ckhwybJBXGtOT68LTvO90BsnqvhDoY
	eGFOdWcZfIeS+gTynlr0gIQcamsEKcZcZku7xbvfo0l2PYAtWvYt8T4YkKw0kZBH
	petMWNgILtRnKqWNy4cQM1hiCUcFMs6Gu1KliC2dftBxHSIGnn68V8um3IHMBGWl
	oWX6ic7dl7oSC640PzcDM0Ms4E3NsJFHIRg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbfuw1vbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Mon, 16 Feb 2026 11:04:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71500f274so321313685a.1
        for <linux-leds@vger.kernel.org>; Mon, 16 Feb 2026 03:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771239886; x=1771844686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0/8HLHKTMuvxrvPr5krz/RHUrMsQYb9h+0RcCpClv8=;
        b=aWnkHhTybi/Rhdqwv8pqzeFB1JE2TWyb6K5x+jRark+haBSB3YMYqbjoleBoROb2AI
         q7sHmIk2tF9zpl/OjpBR+3ncBt5eD6lXbCknmK/4QOHkHgAhN9+mdNFUX5Op/ePS3dPv
         EDs8/uRxp3yGoBhNd9tK8ibrjlGD/NvuVhYCGGFBfsIoD6hxz6r0TZ2oVZYTBnfQfs28
         x0YFNKKUrzZA+xEj01V905woDBCEG6fHTBE1v9isMUaERSFfPavFJuka/JZfc5HhEvgh
         dpzKc35i6rGHaR9l8KmjYEQdcIlJiJWJq+ch5DuH5oZ3xru97h7hpovOawY8skn/ILm/
         1sSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771239886; x=1771844686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0/8HLHKTMuvxrvPr5krz/RHUrMsQYb9h+0RcCpClv8=;
        b=IBt9YpIG1tOhepVsFQRxiff0XFWRGaXl38KDF13FCVr4/pXBLE62z5W8Jr+htC2ZPJ
         C1TMxl4XvvEjhDFAAu53Us6gjH0U/igqD0KCuQK5l2W8CVtf5uC2d2I/NA56/E1vhQvS
         JBAN/9Zg7vkpY80u2ymMbmnEPJFk/LW/LSm4MdV8v2HZqDkXv1qzye80YzRnE4DHONlb
         DwjS5dBM80GguPc/dSSqAJo5hpwLDr3OyISROFVAzet3F86JBJYON5Mnmastpdwu/Yk9
         v2YoEuCGXX+fRg9o9NEKaaMfqd3OJl5QnJlSqUIjtawFB1macQ1hLFQGeZvA3g94Hw9t
         NhRA==
X-Forwarded-Encrypted: i=1; AJvYcCV3X1IN/QsK5/WR9ZUmo0LwDdO6dvYMvZGHL6i//UAREoUpHvNp7SQfOvcwG347u9JEOpm+5arHkJZj@vger.kernel.org
X-Gm-Message-State: AOJu0YyYba7ElzY2XWCj6+Jxf1okNENPHi/p4Yf/XAmjEKHHimbAhO+J
	t470y+82n4bIXVbPKWhXOJbbAhDz4yUq7QiKzaVvaBA7wTDcRs6sbcKUOZo8V+yg7wrDuSg6iNV
	aOklPQchr7XKS5pNEGJYog59S+ZmkuE8udxugMbwmfieC+XIz8YL7yBCXaNBoHWW9
X-Gm-Gg: AZuq6aIdpKf7sjGqoPk6zpA5VXwFaJ42sx1GbwudFPZIB20oT320FkiyagyDIuuMvEr
	B+U5C86zm9udYC5bJ3gc94nju9QEuHTTzuTDJ6UjVIzqNiSwigB9WG21k3Q3HF3dp7s7oRYiiW1
	ZQn2UgI4yPJ4MADzlzOCOu8V7kKcLCCgJB++IyL4apNHw7i45Z75pr9hZ8pYNTHUmkY6WHcgXRm
	ov+jxtZyGnTmbEspBfyuTrWrLWI4+GPecYMOYdPk/EpNrvDhPYLzKGU20uyL/vQXPqYtR/nK5h1
	hQ2UAUTXaiwfgQ27PnCxfZQ9c4mOiCXJb7mmntoBhTTo8AOygVpKiGflbI9E9NEirEiX/uPXKFm
	/AGHK9sLZosEgqUFSIFUiwML5zLln805BymClxA==
X-Received: by 2002:a05:620a:400c:b0:8c9:e989:9d97 with SMTP id af79cd13be357-8cb424afbfcmr1140210685a.68.1771239885667;
        Mon, 16 Feb 2026 03:04:45 -0800 (PST)
X-Received: by 2002:a05:620a:400c:b0:8c9:e989:9d97 with SMTP id af79cd13be357-8cb424afbfcmr1140206985a.68.1771239885184;
        Mon, 16 Feb 2026 03:04:45 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac9d77sm24443815f8f.33.2026.02.16.03.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 03:04:44 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] leds: ktd2692: Make ktd2692_timing variable static
Date: Mon, 16 Feb 2026 12:04:42 +0100
Message-ID: <20260216110441.160155-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=891; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=IojXgkbf/qVR+mEiPG55DitQ1haq8Tu82cJsmtqwOMw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpkvnJOaIkAXXA2IHcMo5xsEdj+dKK71G6fbw4j
 q71mhUJdSeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZL5yQAKCRDBN2bmhouD
 19XZD/0fTrgk4tyyuHsF5lSf+6D+rob2E183kGvWWywtK1QRchc4E+hEUXYgP8Dl63yTAPo6pe6
 yhAG3I+ZvNDpCdJdx0RUmB1kfuD3VpMXAhIR4dGsC9w4Wp3NrikEg+UXTju2KL/Ex/KiS8Ovb8O
 j7V80ZpUFBC/de8folLcpKrzoTzOHQOJh7eYvV5Q4kWQQmQF+TtUHaYjMk0qStcXs5dYB1dRkIi
 l/lN/ytbPPwO2Cg3A9F6sRnhV4k+aSRPz6W4XChfnXdDtEMC/K5/b4Ed2buSig7V3FlxsckW98A
 wUVXpS0q2Bh92ccyazvvHGLIzRLjXBlSlJyOvvrQimarBAYWTBX8VD6HXPwG3bJu0B3dcTef53n
 vthOGx+9LSvwm6dEQ8xaCWRs0ZwYFqz7ui4+P9XEDZJIvMBX1+vUcenuGryU5vJJcCNGFO1Na5S
 oWsToTS/qTSn6pKj0CiQsunNwTa874xRm/zCnaAKXiRaFGUzN9AvM7hqoKgdOXHC1qqZ7s0NpA9
 PcD176nO7nUCVDpXWOkgBgLax1jl7JQiQioj6krR6yni4jBhPYNp1JXLweKsos4fx0iHR+Qd68q
 7ekwZWjYptVzv7Xl1uoTHKLQANE5KisTa6j3lQrbsbMsQyNRm4icD86oIJifC5IlHAQZIABi7M4 uYnA5sv2KjHlPcg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Jb+xbEKV c=1 sm=1 tr=0 ts=6992f9ce cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=OU9oH5_OfXCBwDVY-OAA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: kC1zFzyY9ocw39T3g7gCIOjlIN6Iu_Sa
X-Proofpoint-GUID: kC1zFzyY9ocw39T3g7gCIOjlIN6Iu_Sa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5MyBTYWx0ZWRfX+17eADNkBtTQ
 0XxGjemcKigLysVx3liwnJs9pWp7HCJjYEhZtdeJmE83U7S6q7JN1i5utN0Vk9vHGmBFpA46mrf
 fG1WCWjpbyfIsD4I4y2qGRuxu8+jYOSsPGYsesOrhr4B4E6IbYdFbI+Nnp/xEbmQAPXudP0XKCq
 LjCbRuN+wUbNUuth+lKcAU2Di7rnNSfiuY1bNeAnkkT1AP0G0a9A/8X51KIMU4o611T7OkQM00J
 WVr7eAuaukn+yzUHYH7BKgP6R33c+WXpa/OGY7xXh94vt+yKt4PfcNma4AQqXIXXDxoZdaKDr+p
 cDHy4oJpAGsnpVefDr0cm4jtvM0hLZjUekOmiolqkdtdaH95QuMBXK6QZwSx6LT0pjFMPh0ZC4+
 Ywi0bfcafbo+d7akHie0dJbBB+b6MG614Q05nsEEU0MO8Om7c+KuWpyA6LAuh4rW7OE5ov5ZWCP
 hjbC90kFCRSpUoAySrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160093
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-6950-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7C4CC142A46
X-Rspamd-Action: no action

File-scope 'ktd2692_timing' is not used outside of this unit, so make it
static to silence sparse warning:

  leds-ktd2692.c:62:33: warning: symbol 'ktd2692_timing' was not declared. Should it be static?

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/leds/flash/leds-ktd2692.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/flash/leds-ktd2692.c b/drivers/leds/flash/leds-ktd2692.c
index 0f16eefcfe4c..22fbfccd4873 100644
--- a/drivers/leds/flash/leds-ktd2692.c
+++ b/drivers/leds/flash/leds-ktd2692.c
@@ -59,7 +59,7 @@ struct ktd2692_led_config_data {
 	enum led_brightness max_brightness;
 };
 
-const struct expresswire_timing ktd2692_timing = {
+static const struct expresswire_timing ktd2692_timing = {
 	.poweroff_us = 700,
 	.data_start_us = 10,
 	.end_of_data_low_us = 10,
-- 
2.51.0


