Return-Path: <linux-leds+bounces-8796-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2suoEfPMQmqtCgoAu9opvQ
	(envelope-from <linux-leds+bounces-8796-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 21:52:19 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB566DE806
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 21:52:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oxS6m1ud;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DdolsNgE;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8796-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8796-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E70930142AD
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 19:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F3EF31E82A;
	Mon, 29 Jun 2026 19:52:14 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B457124BBF4
	for <linux-leds@vger.kernel.org>; Mon, 29 Jun 2026 19:52:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782762734; cv=none; b=YeLWFdB58mqo8lgsZox7+95INX28lXsUpYozXRZ0LiXo0XPaWLr51N6Y94ZQ69IYJ/snfjvZ4UgIAE0dQ6uyU0uePXHajfXWfjDCf1HU85YYlERThZTelGSvFmUTmbD+UYH32S8cG5er12gxNSsdc76L9YT9bl/7EGfXAZoj1SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782762734; c=relaxed/simple;
	bh=jwWGuiw3QNOOc8+7UuS4DFRow4gvfUEqaIQPPEv+/JI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mbhKYcCskA71D/dGk0TsSLvTSdwI5cF+iWSxVbXoDWC6UwRiiQO1vgHMFzqu3K4af/fZ82SVgnCBX/dewcz1tA1GsAFeVRGTYrjgBm8LzGkeHeel+IuqZsaeZRhxw2Sq35rSExwlxm6t0oH0J7IBacn2sKmOLm7p7jtQgQB4MDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oxS6m1ud; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DdolsNgE; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TGK2Id3388266
	for <linux-leds@vger.kernel.org>; Mon, 29 Jun 2026 19:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jzAMeYuDqDsgLfXppsKUFN
	aGZ7zLI+C/WLqo7NaMSSo=; b=oxS6m1udt4eS5V+p09Gnzbo4O7JjTsXZfjNwgt
	IORRq29xPew9dzi7Xhc+INuYX2nk5Y7V0S/E+4YJu7Gz7KOTcecIJftFJlBqNbN8
	lZVW1DG2t+TkKxk+b4VkUCDJZN8xeJ1faI+ErMVSnKW0GFBuwtjeya3tFDO1d0vo
	xJmOJHh+VFpBeEPQkLqQLI74bVHUEMdTp/NF+1jQM93LInaZrlOJfKZIujlSJdwS
	LtdbUVK/4O63hbzhB9VUEj0ETthrEQEbMK4sZA0YcRvJt17kL0Y+SUXggcXBUsuZ
	T9RpVHKLWzJFTy7nzcWCg6gLDHK0Z+r8/xOLixci43GJd5Cg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3k7vkm9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Mon, 29 Jun 2026 19:52:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e4f946461so313818185a.2
        for <linux-leds@vger.kernel.org>; Mon, 29 Jun 2026 12:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782762731; x=1783367531; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jzAMeYuDqDsgLfXppsKUFNaGZ7zLI+C/WLqo7NaMSSo=;
        b=DdolsNgE5aXMJ+F9Gn21XlEcoHsLIzNDbFkjXIlHDY9e9r4EPno100nT+CDsAVVgNY
         LKLlPee5XACfnA9BKcbv7vYSDX0WFDlx8QnMORDu9GmZdS2GRAzzVJoI+0BP1QEFwRd/
         xMmMPZTV0dTwPkxLzgzBgeoSorEFxlpl+LXlrst4ceqHgRj3NYyRLc448ldoCynG2tGN
         qdmT9skyg2etYTlV4g1jwWi9iwRlTqGpkArio7eI33X79BTONG/n156u+TvPPGnaCqN/
         XYiF+CCjRUsqpZAPVaxOUdmRTyZ6oaAQ/rPtBKtYzoZKnFhPP8i/Lc9eyrjrf292up0T
         +Feg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782762731; x=1783367531;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzAMeYuDqDsgLfXppsKUFNaGZ7zLI+C/WLqo7NaMSSo=;
        b=AvyL7wBReMc2Zqd7tEOYa+0Zji+3bFi+7WFG/jK+jXB4+hHvbA8psEnMpq/QcVwba2
         nlg/hZdeaMTyLfnNuztLIU2diOWsFF+LLzpxy+A4Ffz6Gfu7rl+pjTByGZzbnLz9SU84
         J76YqF9k0bBgmrajN+AvP6c89jP0iFQ2l0oyOYw5fT450wvD0y14Ef6krWXe4DECq4yV
         DbENE5h/b2Jk2pMO9af0QNnG9HTb1BkveqO4//VMEWewpWTFHYp/RfKRgInKAHLjc3IK
         fvZ6XIysLVTd6PeksuZ4ZVtc9huEL/tfS2LozJEJ1mfLYKC1XJ4xNkyboq31X660wxJl
         ZpQw==
X-Gm-Message-State: AOJu0YyouJy1KLt/RFoGkRpfokYC4bjOd3NOUMKNf/YugXYBMD4K14f4
	wa19c15Cz7Gez+qP00JGlvjpwAHAfZj0xxPaCCS0Mw4CziZusLum2dYckWr3ekcSVd92FQj7ENh
	m3/mltiGe5QBN0gyfd8itl6HfpqC2ADzAunV2PZSCr5VdEcXZQH9QtWHRIOa+ABaC
X-Gm-Gg: AfdE7clLtlg4vKlwGJ437+4dTL74+E/XMztqaWi5lvDuURusMfdqZRi1C1+S9ZyWvdI
	NmecUiG2uiYmpuG3PiN13EFiEzmyzPB0QTsvXS9vw9BpOW1MbkYrzPAsWP4Rf6p5eQfKn/EjshM
	xAlxSKdA52n4Bsnx3AkOfCg4DUIXzqPAB+rmuEYyo/T9prmdKevFIF5vc3oenBvYSs9VPopGiSb
	D+AVpKogHUByjiPvaDkn0SApz4BQRsm4VyYuMTKxaQKVDhd8p//mI3khruZyYfaIz7oj6OVq8uf
	Qswd0pn3rgBWQHVh5IDGvpvBcZyzCj2An+JwrRF5/RdK73AZ0n4wjUKgmG3GBVrSMqpaFw1Ccz/
	46tMMbnd7NgIKpqY1M68xW/nmhnV6hEpnS9L0sBQZJZCm7IcZyTQnObGFQi0Qk9LJfuNOgrKm/Q
	eCqtjCzLwb/Zokyrf8hoRFZgTTvXsm6hoQU9F+2xp6cROTDmUj0prQvHPK9nUSOP2Ju90c51wsF
	80V0lK1vw/9F3PC6etS
X-Received: by 2002:a05:620a:1a09:b0:92e:5856:bdcd with SMTP id af79cd13be357-92e6287e359mr155313885a.53.1782762730598;
        Mon, 29 Jun 2026 12:52:10 -0700 (PDT)
X-Received: by 2002:a05:620a:1a09:b0:92e:5856:bdcd with SMTP id af79cd13be357-92e6287e359mr155307785a.53.1782762729850;
        Mon, 29 Jun 2026 12:52:09 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493b8d99565sm6360005e9.0.2026.06.29.12.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 12:52:09 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 0/3] leds: pca963x: Add multicolor support and enable Monza
 RGB LEDs
Date: Mon, 29 Jun 2026 21:52:06 +0200
Message-Id: <20260629-monza-leds-v1-0-0cf7c0a7dc14@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAObMQmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMyNL3dz8vKpE3ZzUlGLdZCNLo1Qzi2TLRBNLJaCGgqLUtMwKsGHRsbW
 1AFdMQEdcAAAA
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: S1UDNF4NgZKqEx4ZQE2ZDwbzPlb9qqoo
X-Authority-Analysis: v=2.4 cv=CqCPtH4D c=1 sm=1 tr=0 ts=6a42cceb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=_-IZY4xtMCx_iijEg8sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDE2NiBTYWx0ZWRfX6Csk1/z0vyD/
 JjW7Q89YYkribLzUielXsr1KNbLWweH6w9MUo1WQThUOEtKrlLwjMBQLKbWenWd0cOsBlDWUcY4
 5h0oOm2fhU4Qv8Bbnaio+JtH9Ys2m6I=
X-Proofpoint-ORIG-GUID: S1UDNF4NgZKqEx4ZQE2ZDwbzPlb9qqoo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDE2NiBTYWx0ZWRfX4RCepiHDrw60
 0MLsxzwbKUN3S4UzV7JbAz8JUlrX1w0UAux5taPYjbjohA1736hJUGfccROlUg0nC5JlCrDKPgE
 4CHYBIVroTXUbdFZb5qBdrO3u4+8ZJmlbUaI+4vnEHW69yft3wms+8QXire8T6mRMtZOlLIHx/R
 5Drjm6B8HqDGRV8quwQXIwEP3C2yfs2T2AJIlMluro8qBixn2QnZ5yzdJgIEW1kQPWtHqD1ZE4t
 9XjfJMm5YttddiwkU4ebuEASCPK+XeTREFSwNuF5IvSH+UBQwvIzB4G3jC1FwiSWofcNzBW1yN0
 xd7u5j9K5XAcamuxhVa78jlxEtNRUG0vZ4I45oqDdn1rV00hw8dEo4KhqYX5JUNazPsm+5bAmw8
 Uee0KaykDxtbx9b08Un6jjeOAiV9bFOwW4ew4UzbHzuz4yaUn1NNmaGwtKmHizeQCqeuOcWbp7Z
 +9GTWngCA/AUjgmkVNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1011 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290166
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8796-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8BB566DE806

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
Loic Poulain (3):
      dt-bindings: leds: nxp,pca963x: add multicolor LED support
      leds: pca963x: add multicolor LED class support
      arm64: dts: monaco-arduino-monza: microcontroller LEDs

 .../devicetree/bindings/leds/nxp,pca963x.yaml      |  83 +++++++++++++-
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts  | 110 ++++++++++++++++++
 drivers/leds/Kconfig                               |   1 +
 drivers/leds/leds-pca963x.c                        | 126 ++++++++++++++++++---
 4 files changed, 301 insertions(+), 19 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260629-monza-leds-c292e68c9a49

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


