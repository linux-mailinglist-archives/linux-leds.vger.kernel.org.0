Return-Path: <linux-leds+bounces-8936-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c0AQAKbsS2oMdAEAu9opvQ
	(envelope-from <linux-leds+bounces-8936-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 06 Jul 2026 19:57:58 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 586F57142F4
	for <lists+linux-leds@lfdr.de>; Mon, 06 Jul 2026 19:57:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AXPU7Qu2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bv8DGZtg;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8936-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8936-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C81639EA926
	for <lists+linux-leds@lfdr.de>; Mon,  6 Jul 2026 15:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1373042A161;
	Mon,  6 Jul 2026 15:50:03 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5B338886F
	for <linux-leds@vger.kernel.org>; Mon,  6 Jul 2026 15:50:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783353002; cv=none; b=YAoEUov9sSxxeAb5q+tBD2AVgS64swDLVvv8LeSyqD2jb3m7s88fChlD71Hnnl2ZyFrRr5aOWYonOKyKaA/ch4GP9cmCpV1vmGPWJ2BMGX4EmzY62yi2oxZpAveBL3XisanVBpEDh9a+hHKDHLZf39NzNLBBb6aXB92nrymiYo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783353002; c=relaxed/simple;
	bh=1bKQycjYVzCVtRQBRDEuo6LMeDTatNw65H0xzEmCMbc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MwiTzu2eY5449oOkSM6XZsbaBb9wzQQC5dHxJF89vbi0ojmOEcbkHW52roCqE0d7faWVRSoFyLI4Knl3JldvBhtacfiDV7VunQtPZOxJkjk7lJj7kkMNCAnbPnX4xq05v/mMC7LZKe+PHMqGDe1GX8hpcBA9/45uiBg+BlPSpOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AXPU7Qu2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bv8DGZtg; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF3nl981419
	for <linux-leds@vger.kernel.org>; Mon, 6 Jul 2026 15:50:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kqFj5dY9U6iOMvAAlIXRKb
	v7dLowaF3yIZAVqsjVVxQ=; b=AXPU7Qu2M6YxMWNTT4DoPyxml7N4HrIkqBIPeo
	2NqAdX4Dk8v30oQZ8lIbSkQTnXLUE+/P8omLz7GqWGlsPbbtsn5b3Gsyc+h24Mb9
	hzXUW51ruoCHLabGLxfsGhqT/CjZ/l7Scej62wBVFiT5MSPskWCWBQ2jXZGfSOSw
	9WlsYvNDR2FJDO96ACCNDsd9qwXhQn+QFOUHnkihomMs6qGQZe4ler0C0xXxHQrx
	rpmautuHVfgzSesZQT0mK5YMzCLhQWERdlL7Gqs3L+SW9/ga7x/ccqVpWU79TkpV
	2Qqio9XFHDLUCZeOuefzIyNluIS/3EJezX/8toyijrCSMwUA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgsrhr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Mon, 06 Jul 2026 15:50:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915d3261c5cso277252185a.3
        for <linux-leds@vger.kernel.org>; Mon, 06 Jul 2026 08:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783353000; x=1783957800; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kqFj5dY9U6iOMvAAlIXRKbv7dLowaF3yIZAVqsjVVxQ=;
        b=bv8DGZtgKJZZ2qlwHB0vi+80MLKWjLryppf9XqcYttXHhdAHULrXVooN5r0mB7h7wr
         74YXKpjm1ars/5mjOsVTF4p//sHVmzf+h6/R+m+iIVy6Uqtmtk/3TH8UXuPY9TiLnEMh
         RI15ZZtV+VjodRlnNJxbfggQf30IoO6hH7DtPB3XpKkk1lnLWcu/qpLyU8ZRprhKiRGV
         uNgQ0qreOwj+aDAQpITzlImCtsTd+Eg9cu6pomMVxgfHo3fA7WCuq5LWDDp4cXjwUHOq
         vIWj2T0NiaLZTSx63ts37HNEqRoOAAZ24+10982JS2dsBCFo6/Vbv+36h0Hk6dvwaW/t
         EhhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353000; x=1783957800;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kqFj5dY9U6iOMvAAlIXRKbv7dLowaF3yIZAVqsjVVxQ=;
        b=FInA+Bgx6ianB6jsaLWxX/EDFhYrEQJlrI2c2dQyqoWV+OV8aBWpDQGS44R3saJ6Bw
         Me961BGiYdh7w6fg9neJq380BPQmuHjOv5xccAKxC5qWuVpgcFoRAT/5OKyAOkwtf14Z
         OSSAaLarBSrEMVp85vrdL+v+MaIp6RMV6ecebTt/lh8W0cwjm5NqHJmRSUIlY/k1ctSI
         +2txhxUi91nSdLV4viUkw5qQ3LYCfUUV5ozL742s38x+xwl45SCDSBBYWi7kQAP4kyzM
         QxFrGSCYU3SSOcTA8MPOgU4Wa8A8ativ1UUnlQhK+KRHTIWbObMBOwH9mleODMYy3v1N
         5ldA==
X-Gm-Message-State: AOJu0YxDB8Ep09g2wdHU62DzCQMBJ2KdWTc+L+V9c7eCKkZL8Q5019Jj
	GDKpUFNyfm3DuucJCrWRl/T0Y/psXA9dD6q8rXLQmkJy0OsTHsoCeTz1SPaezrskJcVWT4Nygiw
	+YB1AIJ2ot9P9aRIQFfbQoo+7pYUX4JmEK/s0RF6nL+PKCkJorCd8bNCigKPIo99AaqI23FMe7D
	4=
X-Gm-Gg: AfdE7ckFHn3MXNChEXgi6Z8IQPcVxD5uQJm2puiux/rcvZraq3eHTPEof2YnMPd5k+8
	nyOLNf295wpb+Kh4jJj+C/voa+hPG+swxpHqKZ0YRey1atV977/efKbzjOWCVL/vliqLyJOxTIQ
	c4mUIKis8TD8wKVPT8KAg9RBW6e4Lq+6Smezpp2e6qEuXa5iU/hKH3LGiOoymWJeEdBh2opgCeb
	XrCDppo5+kC/YJE9/ppL8jGyc0jBjaJo6W+Yp7LqrWHK2ClW4Yl83e5YHxLTIIhf+Ez5Ehv7AuP
	AIQzgNLZA6LJI86qNbWz7suMHYf9g3ne72qu9x2c7RPsN1ArustUd6UBPT+2GDaWelN9F4JEWTj
	taaU2ABR2YnZQK3T9rIYGIfJxDZKRmzj5MBF63RNMCMC5sp+E3Fhj75M4afOGAyBTaDu9AluQS4
	IggYnZ7jAeUPqDCuTagnDZcyenRPpl2srUdijfDeiVLug6SOOgkhuYxE+PZUdgbN8=
X-Received: by 2002:a05:620a:2995:b0:8ee:bae8:2bb8 with SMTP id af79cd13be357-92ebb553633mr152134385a.36.1783352999528;
        Mon, 06 Jul 2026 08:49:59 -0700 (PDT)
X-Received: by 2002:a05:620a:2995:b0:8ee:bae8:2bb8 with SMTP id af79cd13be357-92ebb553633mr152130385a.36.1783352998999;
        Mon, 06 Jul 2026 08:49:58 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b628c16fsm801997066b.37.2026.07.06.08.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:49:58 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v3 0/4] leds: pca963x: Add multicolor support and enable
 Monza RGB LEDs
Date: Mon, 06 Jul 2026 17:49:54 +0200
Message-Id: <20260706-monza-leds-v3-0-37ea8c988363@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKLOS2oC/23OwQrCMAyA4VcZPdvRxtFaT76HeOiyzBW2VVst6
 ti72+0iwi6BP5CPTCxScBTZsZhYoOSi82OO/a5g2NnxStw1uRkIUEKB4YMfP5b31ESOYIDUAY2
 tDMsHt0Cte63Y+ZK7c/Hhw3u1k1y2m0ySXHCBrUZhdYOyOvkYy/vT9uiHocyDLVqCn6CF/BMgC
 yhrEnWl81NqQ5jn+QuyeL3c7QAAAA==
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
X-Proofpoint-GUID: I6peV4-HrGk0106W4bdW3S1JKpgUmIr6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2MSBTYWx0ZWRfX8+QGRNmWGJkb
 3phkCM3edxbA3sjBTHa8ySMBlsVAvAhHSrf/jjjh3TpdO/H7GCOf7JhbS1bxDY3D3qLB1nt5Uey
 6X6iVDtJrQmsU+Gqrl4YHUxukDVxlfzMDrEDTTqZgEEhhblNRFuY2E+eE3ov2hzDDG2TtiXYJ7X
 QHxGxcqFut4FwiftU+L7oioN1u69husu7RvYgqOD9KYr/+HRUyyv49TMCKkN/3HCg/91fnbMsfs
 SR9UcZ4wwHq4dVY6nO3/H5spNc/g5ZTq4jwHvMUpKhMvbqfxIv/NXi7y0ASyofz64VgTNexhWAQ
 HOhjZvi7ORp4KwN9vuCy3QwaXx1JanS8xWhaWBXWBuTQS4N+hZzqQ2r5d4RDgqDwlJ9PX3yb60y
 c2Ao8O8gbzLpMHKGCJItfP4wN1WgMJ5AcTghhaVxzfGNWr8RBltBmul9PW/t1vv1RumGE/MfGrS
 jLFx1AOE8VfiQBUv/cw==
X-Proofpoint-ORIG-GUID: I6peV4-HrGk0106W4bdW3S1JKpgUmIr6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2MSBTYWx0ZWRfXw65KS+zzI2v7
 79JKa3T/cbi4c2QGgGH/WbfI1Rcu6FZ19D6cPiDl0gqLopyDlN0zRL7MfLj9kEhlE5oPq/MTVLv
 tbj0AhbmLS1XJjSI8Y53eebbwF1kx70=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4bcea8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=yzvYhh2-rlWI4r5pe9MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060161
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8936-lists,linux-leds=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 586F57142F4

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

 .../devicetree/bindings/leds/nxp,pca963x.yaml      | 116 ++++++++++++++++++-
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts  | 110 ++++++++++++++++++
 drivers/leds/Kconfig                               |   1 +
 drivers/leds/leds-pca963x.c                        | 126 ++++++++++++++++++---
 4 files changed, 333 insertions(+), 20 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260629-monza-leds-c292e68c9a49

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


