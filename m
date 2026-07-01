Return-Path: <linux-leds+bounces-8816-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Jg2REKc+RWoU9QoAu9opvQ
	(envelope-from <linux-leds+bounces-8816-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 01 Jul 2026 18:21:59 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9EE6EFB52
	for <lists+linux-leds@lfdr.de>; Wed, 01 Jul 2026 18:21:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pCWIxKkP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WTXzWTcS;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8816-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8816-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D151301AA40
	for <lists+linux-leds@lfdr.de>; Wed,  1 Jul 2026 16:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7342341650;
	Wed,  1 Jul 2026 16:15:56 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870602F1FD0
	for <linux-leds@vger.kernel.org>; Wed,  1 Jul 2026 16:15:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782922556; cv=none; b=L0sTNeY97FMS5thKXlLwyFPUMyUEJ0TzIgXWCRRyVyQDWyHu/4/Lh45BohQRGLxJ04LpVHQwI18qZzGiJlCjG/ZFVz2eS1weD0AkAMtj3vpHoC8ra32zI9x88h9Ts9EjwJMSKVprdEYMiy8NaG5gwy/8eC43doFGMmb6XOfJS0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782922556; c=relaxed/simple;
	bh=fffIHIq+K2Xt5vA/CwQMB8tzEP5cr2Jy2YbmMNydBjI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UA/HsE1wu+iLJWR58b6PQ17Apj2ST9PPiJfPXynSsaljRoOOMHOlzPnNYG6XuYyIAFyvAdGM+WsDALpjZmaEfK15q4r650e60FNc3TT1tglQqZhMB6MrV0QDtjSDJrFkNNWAPNTNhBzdNoEou+qSNNspFz9SkmluPvDuT+iVhAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pCWIxKkP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WTXzWTcS; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661G3Ipu1504120
	for <linux-leds@vger.kernel.org>; Wed, 1 Jul 2026 16:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kf+pwVBk5mAbEcKiU3KEkL
	A1zCtomGQqKVOFrEXk2TE=; b=pCWIxKkPE1J7j2MUqm8bIguckB3q4en2Y6TK68
	6a26I7gMeYxeJXJT47MCx+/MIAWRHIPPbzipzT/Skd62EymUx1iFG0BO9RxQRT9X
	AOiUuLLPvB9g/RX8bRarrxfttgQkKl3ukmjuYahVpZwWfZdZo+xzhqLF4EpN1hZx
	fszP8Y3zqRnYMHtZ1EcAi1UUTPULbH7HWrFcxe1V5uQJQbkuDuLska9oSupFDTZJ
	FhV7Kdj4cqmBweK17aPk5HRmL7dgXThz2FEygbiPm8f+g8AnRC7Ov+elsNwCfItt
	1Wd0mRZJhud1YW2uGtCKELqTk3r/Lln4lHCERE/UQ4+1depg==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5630823a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Wed, 01 Jul 2026 16:15:54 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6a155636ec9so593892eaf.1
        for <linux-leds@vger.kernel.org>; Wed, 01 Jul 2026 09:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782922554; x=1783527354; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kf+pwVBk5mAbEcKiU3KEkLA1zCtomGQqKVOFrEXk2TE=;
        b=WTXzWTcSfWv1enyYQ1kV8ijtiVngb+t3zFOkD+0C6BopKM+2KYQl41zQ60CWu93nJ2
         uEn2EitwoBeKMD9nLySMA254aJw4ffoJA10lHJVIvJx8DdJcjgUkwBI96abuPbtKvjzO
         1G2J+Li3KK8ynmWqrHcvwO9HgGTy2/aGcKJbdYI9Kwx0S10gjpS1qZ0hL/EsC7kW2E0a
         yzZty1ZZdr61ryav+v/H1h0mLPNljdgWuG2baFZjAFCR7Mm5MQp5xhDwCQdc27hTgyGC
         qrJyxL4ys6WtQcfTARscYNBE2YQ5oLcSHsq/40ijSc9xVoHZaM51j7EHoYMaPtCAmRq9
         UgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782922554; x=1783527354;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kf+pwVBk5mAbEcKiU3KEkLA1zCtomGQqKVOFrEXk2TE=;
        b=E+jRqIQ2YhdIp7F+3cIFUyeNvoJwO25SuhSLaevR7+V9r9WdCZS/ZiihG+SOWrIq/b
         KaByKW6xodCoi/ofXXWKlAGlt1iFpwC7MF1htoX4fcSK6E0gc/UeQqC5RxqB7KEjRcWt
         4IKR97C+Hz81r+NOMEyCPpjjZ0ufHeLsZoAJ+K3d+ZvSlh+e5qzTw3QUhJbw7KizUw8l
         5DD7eNqh+G9LLHxw3BazgudSW15aTZQBAuz/BV/0iHFFl3C8CelG+PZaFnBK6mQUHFtM
         sUpbV5fN2dhgB7OuBcSENTNnw5XnfOmINxFa+E83GUPjCq1PgzfCqX+KDjPG42sQNlk8
         AdPg==
X-Gm-Message-State: AOJu0YyKe4cXgoKEXcAFJzmhxhTyqzWrejMEzBwgPYn4C60Y9PoyaFKJ
	7n0q4h76f85qwRdnhCMIsYZ+nr+MXVaTPfzX+1i3BhLWO9487UUlyPkNDfiRgWwM/qAJ3JexMQ7
	VBJXmQlrjORXHSqVg2a7VT2X8UmuhkWFgXAYqfg9Gvy6Qal53tWwYGHENbbxB6Yt4
X-Gm-Gg: AfdE7ck8xOnVbZuRlybJwxnDNpr9LgkXgj7TfQ2qT+ypzvOBpkfrOKP3DYeJoAWQUcO
	42dbX3mZlXtDFduEQFwaJTBuNUDCq/AJPJvt9zye+obV7jtysccf766ZKqBLTN70gPV7lknDrV7
	XjdcdGNlljjZvvY9LbWZoNb+zXgMZyMu4PyDW3NYK8wS/JaPE1ZjGdxwFRL6KA1c/fRbeUcMZpB
	ZpNScXjjjJCWF+nkt5b6dOzUy1RbR6X+th3NZO8B1DVi/7SUfnqRUGAhJACdXLySV1/8fmQoaYu
	MDrUZSa2a8Pwn7gSIaxAxJ0unB/ys+khX68rtyqO+pVq+akgIHbt+xl/tci+eOVcZS/qLwwqYR3
	ASOQ+j5AMer2zE4l+7IdSMg9MNmKhSUuPFCVDKoK4Sf+ebItfGk4S0RpeVmqHv3MddmA33DkyFD
	sZRsf23Gcg5tMeQYDhp/SD5pqbYtPTLnChi/e8IMdqN1MKYrjtiPAJpppaphf3uJw=
X-Received: by 2002:a05:6820:829:b0:6a1:9a9f:7be8 with SMTP id 006d021491bc7-6a309b37233mr1197988eaf.48.1782922553818;
        Wed, 01 Jul 2026 09:15:53 -0700 (PDT)
X-Received: by 2002:a05:6820:829:b0:6a1:9a9f:7be8 with SMTP id 006d021491bc7-6a309b37233mr1197959eaf.48.1782922553393;
        Wed, 01 Jul 2026 09:15:53 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d1ea70sm299570266b.3.2026.07.01.09.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:15:52 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 0/3] leds: pca963x: Add multicolor support and enable
 Monza RGB LEDs
Date: Wed, 01 Jul 2026 18:15:50 +0200
Message-Id: <20260701-monza-leds-v2-0-c1be0b472926@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADY9RWoC/22MQQ6CMBBFr0Jm7ZC2IWBdeQ/DopkO0gRa7ShRC
 Xe3snbzk/eT91YQzoEFTtUKmZcgIcUC5lABjS5eGYMvDEaZVrXG4pzix+HEXpCMNdweybrGQhF
 umYfw2mOXvvAY5JHye28v+vf+zSwaFSoaOlKu86SbcxKp7083UZrnugz027Z9AVn3Q9+rAAAA
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=JdiMa0KV c=1 sm=1 tr=0 ts=6a453d3a cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=yzvYhh2-rlWI4r5pe9MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE3MiBTYWx0ZWRfXxT5qr1pql9cj
 7qQ09zvkNcA+TLLLOHi5sJm+QRA4K2mzGn/Xt+w93q6PylgxGnfsfxpCJ3zzabNa/6cYg4nR1bC
 Jd3ofDoxFi4NGB/6i16fQ1BqP4tJ6l4=
X-Proofpoint-ORIG-GUID: NRSJYL14O09bfMphdhZAiTV90OtZDtMP
X-Proofpoint-GUID: NRSJYL14O09bfMphdhZAiTV90OtZDtMP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE3MiBTYWx0ZWRfXyDe2IDtTKkrb
 fzR02lvhhP5zvzE3dmps0vs6MVmhGfcekI+NxLV3ElA3S6Qymxy4olw4/QCaqGMP/eS6/g70Lts
 Ex5lIHTRcdtD3FlyUXTGZy3zbeUv/b5ySbvCRLwabLi32kv4nF3owek47CCJzyHosBQSOibCgUo
 vXGEjTUrxAjb5VFRgP9Tu9I+gOZgxkqF1CWwkkXDhhoJiavy835uWR+Zrwguz7QODcKvoVOwkA+
 Cs8NJh0mquo/D+B7FDgBlMnifB0HrV4Kjwv0aLvoVXfi/VD0kY4P/zzZv1dB4JwkgzqlOZO0cSY
 w7pw0m6oS0zK8Yo70WWPk3nOl9gtAa1byCAXzVsFpHvE9u9VdO+VfJs+lmMZPfz1oNTZZ+TtX44
 xV6MBYRwNV/znFvffdzsVDIoxAqeeQBpfBURccZwTeX5Vsk5aHS4I3nJegf+oBc/L8RxotDgVKI
 M7jOUknDLokbtq1NnFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010172
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8816-lists,linux-leds=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F9EE6EFB52

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
Loic Poulain (3):
      dt-bindings: leds: nxp,pca963x: add multicolor LED support
      leds: pca963x: add multicolor LED class support
      arm64: dts: monaco-arduino-monza: microcontroller LEDs

 .../devicetree/bindings/leds/nxp,pca963x.yaml      |  79 +++++++++++++
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts  | 110 ++++++++++++++++++
 drivers/leds/Kconfig                               |   1 +
 drivers/leds/leds-pca963x.c                        | 126 ++++++++++++++++++---
 4 files changed, 299 insertions(+), 17 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260629-monza-leds-c292e68c9a49

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


