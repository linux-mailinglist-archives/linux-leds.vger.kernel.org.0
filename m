Return-Path: <linux-leds+bounces-1872-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9516903731
	for <lists+linux-leds@lfdr.de>; Tue, 11 Jun 2024 10:55:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08F9E1C21B16
	for <lists+linux-leds@lfdr.de>; Tue, 11 Jun 2024 08:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CBBC17B510;
	Tue, 11 Jun 2024 08:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monolithicpower.com header.i=@monolithicpower.com header.b="S/e4JJWB"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-002bf204.pphosted.com (mx0b-002bf204.pphosted.com [205.220.172.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1872217B41F;
	Tue, 11 Jun 2024 08:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.172.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718096002; cv=none; b=Xt1ahky/vAOaiIZwwgdvmJmkYbb1BFAXiWTPIv9fIht9sk/3+875JXUTT7M6WF314eFaDUpcmF6kgx4FY93+4vc7h7AyS8anLuwoVk8xZGzJRdflAgPnKHgg5n9PCCAMfDyclTXpM6NaUt6Zyco+kOOQ1m+rnUPdHAeH1+tb3EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718096002; c=relaxed/simple;
	bh=W3BHzlZ6gBSB7UmPWv3NX/0dDwzclZnZK9/Bh3qSoE8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QHQ1Kwyn5UBcn/BKgcg5YDUZTvm6AYaiznARboah6TQGyEVNjMijYwRG/b2UuiUcTDJU3d6n0TvV09E9/V/SSLKz8eQXF29UjjDMtuWbR0IWmrd7kjZAHpQzeFITMrF9X3SqbUsbR78t2RnKA4Q6Q38c+LWJ+uvOgrCSfM63/Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=monolithicpower.com; spf=pass smtp.mailfrom=monolithicpower.com; dkim=pass (2048-bit key) header.d=monolithicpower.com header.i=@monolithicpower.com header.b=S/e4JJWB; arc=none smtp.client-ip=205.220.172.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=monolithicpower.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=monolithicpower.com
Received: from pps.filterd (m0207525.ppops.net [127.0.0.1])
	by mx0a-002bf204.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45B6Zrdk002210;
	Tue, 11 Jun 2024 01:34:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	monolithicpower.com; h=cc:content-transfer-encoding:content-type
	:date:from:message-id:mime-version:subject:to; s=pps1; bh=bpFueT
	IZ2r0KqeKAGmGnZxhpFCdSSLVE7SrrqSSaKYA=; b=S/e4JJWB9DshMzNhCaNhT1
	AdZhzXBPrBKyD3IdDu8u0dFl2VYySkmLhi2G9kEfIx0Z+Xb5Q6g1A7sG580x8iqO
	93rBEvfqXSd5yESrTDYxpr4+jBlOW3o22PJGoTiBR+zKRXZrTpupzNMXp+4x4ADZ
	tBT/KhRhGIdVAJPoDf7rW0iHp0m1pzQ+vf7OuMWq6FgVj4Lo7LQ4UMmLAXWfyE04
	65VgcDbLuAUMEdnEFM6RZbtn0QB24iKsuf6CQZs4vQFyaC4DJW3RFO3AEYmzq2zC
	HKgDGBv4E3bK3zPJ3TGH8ah+i/8NK1bqTdTT0oaIrFpA5HXmUjTzSjmdxFxs9u5A
	==
Received: from webmail.monolithicpower.com (mps-vpn.monolithicpower.com [12.33.0.20] (may be forged))
	by mx0a-002bf204.pphosted.com (PPS) with ESMTPS id 3ymm00mx39-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 11 Jun 2024 01:34:17 -0700 (PDT)
Received: from CD-MSH04.monolithicpower.com (10.10.70.213) by
 MPS-MSH04.monolithicpower.com (10.10.10.206) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Jun 2024 01:32:59 -0700
Received: from smtp.gmail.com (10.10.86.102) by CD-MSH04.monolithicpower.com
 (10.10.70.213) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 11 Jun
 2024 16:32:57 +0800
From: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
To: <Yuxi.Wang@monolithicpower.com>, <pavel@ucw.cz>, <lee@kernel.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <wyx137120466@gmail.com>
CC: <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH V2 0/2] leds: Add a driver for MP3326
Date: Tue, 11 Jun 2024 16:32:33 +0800
Message-ID: <20240611083236.1609-1-Yuxi.Wang@monolithicpower.com>
X-Mailer: git-send-email 2.42.0.windows.2
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CD-MSLBN02.monolithicpower.com (192.168.86.32) To
 CD-MSH04.monolithicpower.com (10.10.70.213)
X-Proofpoint-ORIG-GUID: TROeet2erSYo9aZOB4Xn2vns07dkxTId
X-Proofpoint-GUID: TROeet2erSYo9aZOB4Xn2vns07dkxTId
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_04,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 phishscore=0 mlxlogscore=685
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110064

Add the binding description and the corresponding driver for
the MPS MP3326.

Signed-off-by: Yuxi Wang <Yuxi.Wang@monolithicpower.com>

Changes in V2:
  - Fix patch format error

Yuxi Wang (2):
  dt-bindings: leds: add mps mp3326 LED
  leds: add mp3326 driver

 .../devicetree/bindings/leds/mps,mp3326.yaml  | 146 ++++
 drivers/leds/Kconfig                          |   9 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-mp3326.c                    | 697 ++++++++++++++++++
 4 files changed, 853 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/mps,mp3326.yaml
 create mode 100644 drivers/leds/leds-mp3326.c

-- 
2.39.2


