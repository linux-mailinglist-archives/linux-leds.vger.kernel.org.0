Return-Path: <linux-leds+bounces-8966-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Whl0NJ5eTmquLQIAu9opvQ
	(envelope-from <linux-leds+bounces-8966-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 08 Jul 2026 16:28:46 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D68727571
	for <lists+linux-leds@lfdr.de>; Wed, 08 Jul 2026 16:28:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jrRlBi0h;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WkugNPff;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8966-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8966-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0124A303170A
	for <lists+linux-leds@lfdr.de>; Wed,  8 Jul 2026 14:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30E5F47887F;
	Wed,  8 Jul 2026 14:19:09 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40C644CAEA
	for <linux-leds@vger.kernel.org>; Wed,  8 Jul 2026 14:19:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520349; cv=none; b=aBW49qLnx35xNTjDa35HZ5S34KDvWe+O5WhWLFYNy0aLNtJk8YjLRfkU8pkcZ3ZweaT2nsLtpx/SDZc0+On9XxXQ1CT6O4P+5VGWSDfIp6Zq6I/NH2FqlnlAW0FYpyLsK0EFle6kYqtkFUBP/bAHYrQ2muvMk9xokb/Z6sIRXRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520349; c=relaxed/simple;
	bh=D2sAHGoeZqQFctpwP5qoYf674QKPbhInAf6VDEiYhAM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gqZcxS82sU3vnN5m1WeDZhcGgQ2uxA5x/Dp8DDAvTCalBGpNUaV7kPyHn6zqve6tdqFMO66TKAtcy/8FDCCMUCFGtAIOjwmKeT3pskTpRX0G2pU9fcxC3rFX56si7Nj1tIZnuT9j3B7MTfoFRjm3fXW14lM9+QeSlRbsRPvicAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jrRlBi0h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WkugNPff; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3ld52580420
	for <linux-leds@vger.kernel.org>; Wed, 8 Jul 2026 14:19:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OQ1iP1u0PkKvFv/dSIZu5A
	aQDlJXSHVHnEZSWYIrLjc=; b=jrRlBi0hsZgndvDo5951y+mVdN20Hsmcw9GYkk
	wgJJHrHeBBgmXn6XmjzDHa/Com29z0uyk/LtnRyf7LyyKIiuNLrPVOE+x86fPQXh
	hp5SH7ORdvpWUYHemBGQhU60XUgzeFME6uGN2kHxxWlIKFteLAh8/WprYe2RHtFF
	CGCn918Oo7wM100fqGLxTdTb/Ty7svWrscLR6G5mRXSKyp3S17dfGdSBA+4c6lc6
	KruIqjybbMTxl5uJD/pPVQCD7QJA+5czNsBgVHtNByo1hdqxSxaiXPSHA6YOb+n0
	HGR4epSCbl1QpNkMvFKH6IFfY14C5rxFFNkK8goHHq6Tp0sw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9b5gb4p1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Wed, 08 Jul 2026 14:19:05 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963d24c3886so690264241.0
        for <linux-leds@vger.kernel.org>; Wed, 08 Jul 2026 07:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783520345; x=1784125145; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OQ1iP1u0PkKvFv/dSIZu5AaQDlJXSHVHnEZSWYIrLjc=;
        b=WkugNPffoD728Dk63/n3jz3XzoFTIwrfjq0JsLVrOwnCSoZLvhTdtOSryRokwHSbQo
         2pAUrkn6ejJCv04few2LNC8lBJJ135EFcleeRxN4+RySnTlrGOujZSdGGksExNx1lp+N
         aRGG/12B7YCENsqCRKumEobohzgDU84gs7xNeW5ypuMxjJU7nnPBTggrroQklwqJ6pIl
         7OD8v1LELFzttPBFCWMOEnDGYwQ2c444q8Rugvpn/D4UYTXhrGZb5C1eFik98w4hCRlJ
         4n4MxFy91JurqFbNJA/Jj98azLNhhu82I2ZWj4k2cBrJt6UI9Hb2PNXmTn3WcmameGRB
         nOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520345; x=1784125145;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OQ1iP1u0PkKvFv/dSIZu5AaQDlJXSHVHnEZSWYIrLjc=;
        b=MhnEfAdSZghIxNmqT3CR0eEeNjLUqXKL7gBHghtdZ0tnxFrtVcb+XQBBhyoUmG6bq/
         CuahTbXiXz9JuMD4rB3YuPIBRFC+fsBz1yiI3aJaMIojFKp12dbip3pIDgImCM646SfZ
         9QCl+HmD+p4jbhfLvbVkHr+jPOkkPlMt7tGUHSZ4j90k44yem1v0uqyRuVMUJRDtUlA0
         9Y+faNLq5VnGXISYC/YQUiwe4mEzvbTDf9ilpfdineMpwp67yEyW1dKmhhbBQiVmlto3
         qKrM5iL651xSLC0018DRBnbWjJLK39NXpZzB1wvSF/kgYvqNClf35gh058Gzw+YmOZN3
         5qyg==
X-Gm-Message-State: AOJu0YxoDTDhL6qtrckn02A1WqnXZTbiWIP/XC9ghkzlnzhS5eyUpOAg
	ckefkJNN7dYCF3EnU6nyGlm5hK8+edMfwpFuGgabvFleWCvJIEGNulXAL4hn52MEvmHnDlGk1ox
	Ztsa7rKHrUGmwOz3jaV5owM6Ie3UvISpffWKQJqIFN9ysKki589pRu0mlUKhv8lGR
X-Gm-Gg: AfdE7cm8jmlpyKYpJYY0Kv+0GI+keW86WpVmGGn9xeukuboIrYNKJ1udm8FQzrOP8DB
	GsNhew2Im3pQ8Xmo/5nk0h2SmhV3tI9HHjYS8M3nr6jCmeexcnXaRLzPDWtg8AE2l+aTqXsdDoU
	FKRlvAXheo9hxeMF6bIzo/VAjjR9eVxWBC1Wfew1GF2XEe8RfBTmxQ+ubjM2dpOKOVrKn32Z3z6
	cVuHYCfqa119K1XLQDHmG8jwkXCJJVu5ITxvlI+xJkH0/FdqfdyM9MCklxDfQ2bJcNVwVs90XTO
	stzs2doBeDckZSNKmwqqXPjHNUEk0EYB293kFQrQQ9+leKFKBGj/wBZF0Km5uWutlRW9Z8avjmp
	BurChphKr/1lVaepu4xBysu3tQvtafVX/GRQ3mVO/8UL7LSU+HLqUcZsOdtKYx+iTM/x46IFeBS
	r9z0ONtlDE9hUmPFmBxEgm8EGpJsRHprO2Dz+9l56EsYey8QqgWKAlXtMaNBRYXvBVjG55gNg28
	SCyY+LsFYotzOjGsfq2
X-Received: by 2002:a05:6102:5486:b0:738:472f:2cb3 with SMTP id ada2fe7eead31-744dfff1839mr1525848137.8.1783520345018;
        Wed, 08 Jul 2026 07:19:05 -0700 (PDT)
X-Received: by 2002:a05:6102:5486:b0:738:472f:2cb3 with SMTP id ada2fe7eead31-744dfff1839mr1525656137.8.1783520343329;
        Wed, 08 Jul 2026 07:19:03 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a9c4a4027sm3080829a12.29.2026.07.08.07.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:19:02 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v4 0/4] leds: pca963x: Add multicolor support and enable
 Monza RGB LEDs
Date: Wed, 08 Jul 2026 16:18:59 +0200
Message-Id: <20260708-monza-leds-v4-0-a7acfc524c0b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFNcTmoC/3XPTQ6CMBAF4KuYri3pX1rqynsYF6UM0gSoUiUq4
 e4ObJQEN5O8Sd6XmZEk6AMkctiNpIchpBA7DGq/I7523QVoKDETwYRmWljaxu7taANlol5YATr
 31ilLsHDtoQrPBTudMdch3WP/WuyBz9tNZuCUUeYr45kzpefqGFPKbg/X+Ni2GQ4ya4P4Cobxl
 SBQ8LwAViiDR+k/gvwV9EqQKEgDDr/Jc6nlhjBN0wcfvguSLwEAAA==
X-Change-ID: 20260629-monza-leds-c292e68c9a49
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE0MCBTYWx0ZWRfXwVCZRlJwWXqe
 wl3jXbEzkhLKwAWqQp50bZiYKxd7xYgFpjjLFnLcGkkelKhfCAHGQO59lCe/BsFGImwS8taJQQ1
 K/evv2oJJT9fRWzkIoY87XWM6VlYm3c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE0MCBTYWx0ZWRfX7AaEdxNU5c8m
 Ioq49sYy3P6o5+ZnG9pW+WdpLbIOTdGkRFrtcAKvr9+uVix2o0h4ZoB+7Mck9KxoUy9i474f9sr
 NRZnNXbYJayu7hbXFuZ9qFkSGQbB9GZLrthfVDWyjVX1Nyb+OEX1pUy7OWR6/0L32QZgOxmjKUs
 +c/tmratOb5VQW/LhjCd1TWwJ1v4R4VyBaBFVtFgKJMZo6Naka1GZjC58tDOd6Nzrodz9NYCm0r
 xV2M8fkN7eDfOM/xhS+hqQyb5SwUItfDfPqsix7HKy0hLPHBNhWUUxzey1cQ6CyxL+fUqd3Edp+
 s5Uw1mOsaF0iQyOFmgv8nenA9rIBntT1fmr2Ybx7p4e1vLlfshoEMlH+0tnIEvse5AXSolsDSYt
 rcw6bEKAYe8F4pr+9kiDP93rb5ajVdftrd1mFvVdfzU3aPF2FrIlvofqTgAaohESB4zqCWdRbVg
 NVNXeTWsN7HKRQK1rdg==
X-Proofpoint-ORIG-GUID: JQ3rld9WPvsbSmoqbR7FXrDUOVghYcpk
X-Authority-Analysis: v=2.4 cv=JLULdcKb c=1 sm=1 tr=0 ts=6a4e5c59 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yzvYhh2-rlWI4r5pe9MA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: JQ3rld9WPvsbSmoqbR7FXrDUOVghYcpk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080140
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8966-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C8D68727571

Some devices use PCA963x controllers to drive RGB LEDs, where
multiple PWM channels correspond to a single logical LED. Add
support for grouping such channels into a multicolor LED device,
using the LED multicolor class framework.

The DT bindings are extended to describe these groupings via a
multi-led@N node with sub-nodes representing individual color
channels. This follows conventions used by other multicolor LED
drivers, while maintaining full backward compatibility with
existing single-color LED definitions.

The PCA963x driver is updated accordingly to detect these grouped
definitions and register multicolor LEDs.

Finally, the Monaco Arduino Monza device tree is updated to expose
the onboard MCU-controlled LEDs (compatible with PCA9635). The MCU
manages four RGB LEDs mapped to channels 0–11, which are described
using the new multicolor bindings.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v4:
- Narrow the led node-name regex to allow only hardware-supported addresses.
- Remove useless 'minimum: 0' prop, and add 'maximum: 15' in the default block.
- Link to v3: https://lore.kernel.org/r/20260706-monza-leds-v3-0-37ea8c988363@oss.qualcomm.com

Changes in v3:
- Add color to required multi-color leds (sashiko/Conor)
- Bounded registers value for nested led subnodes (sashiko/Conor)
- Add fix for PCA6535 reg limit (extend it to spec)
- Link to v2: https://lore.kernel.org/r/20260701-monza-leds-v2-0-c1be0b472926@oss.qualcomm.com

Changes in v2:
Changes in v2:
- bindings: Reworded commit message to explain the motivation (Krzysztof)
- bindings: Kept the "^led@..." pattern and modeled multicolor groups
  via a dedicated "^multi-led@..." subtree.
- dts: Renamed node from "leds-controller@22" to "led-controller@22"
  and dropped the unused label. (Konrad).
- dts: Moved "reg" to directly follow "compatible" (Konrad).
- dts: Fixed unit addresses to lowercase hex (sashiko).
- Fixed checkpatch issues
- Link to v1: https://lore.kernel.org/r/20260629-monza-leds-v1-0-0cf7c0a7dc14@oss.qualcomm.com

---
Loic Poulain (4):
      dt-bindings: leds: nxp,pca963x: fix reg maximum for pca9635
      dt-bindings: leds: nxp,pca963x: add multicolor LED support
      leds: pca963x: add multicolor LED class support
      arm64: dts: monaco-arduino-monza: microcontroller LEDs

 .../devicetree/bindings/leds/nxp,pca963x.yaml      | 108 +++++++++++++++++-
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts  | 110 ++++++++++++++++++
 drivers/leds/Kconfig                               |   1 +
 drivers/leds/leds-pca963x.c                        | 126 ++++++++++++++++++---
 4 files changed, 323 insertions(+), 22 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260629-monza-leds-c292e68c9a49

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


