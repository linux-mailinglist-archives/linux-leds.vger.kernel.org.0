Return-Path: <linux-leds+bounces-3855-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6D1A234EE
	for <lists+linux-leds@lfdr.de>; Thu, 30 Jan 2025 21:13:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 993361639EB
	for <lists+linux-leds@lfdr.de>; Thu, 30 Jan 2025 20:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C38991F130E;
	Thu, 30 Jan 2025 20:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="SHxgNV3p"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2182E1F1305
	for <linux-leds@vger.kernel.org>; Thu, 30 Jan 2025 20:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738267976; cv=none; b=dMs4fgfKlG62CBNL1rRS1WTV83tPxaGS+VB0jktg5P3McB/ZRbbNt0dBqFdoiP9Ucjc1fFWmfuh3AyySZCnmNzJz3hIQSHoiGmpqzi/03geNnFu3AD9/UX3RPIjUscdsDN99qRlvJw9/VZtftnQR5KbfY/OPW5E3ZaJ8n38Vfv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738267976; c=relaxed/simple;
	bh=PcJNuMyAGYUb8Ww3ojf6qnctU261tIwQQHdwIuv8oRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZpW7VPMSfX3FQ4w6IyFh6h5K3xgQ4+HT5wWGOCdcuLUaL1K21XGC3RgtKBIaELQriEFT7ElvnG/KLoYQ2Jq8pHzqCkaLiR+9dXKRYwdbCWyI3Bi5h+WKP67Dcjarxpn3BEec3xApqhiBMKjeOHk+hEqmD9nwymIUrbwN1i1jNMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=SHxgNV3p; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UJUVah024240;
	Thu, 30 Jan 2025 20:12:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=Dg+mIQKKYVYwUb4/bl3o4AjFMkPPP1h8rzsUchukm
	p4=; b=SHxgNV3pj2tBCDABVtI7CsxsBGUxuZB7QOBVg9nCEgk5xdpHkppgW6E6G
	Qp+Da8EG2j+ioMbFRcA4pKF0XheNp2XDuVHI4h3C61Wg9T8ewgSozycomeZZc2Fk
	gHCa4ExbfMeU2OMNO6Yu1O3HMaFDceH3TtawOzsqaVXbfJ9kbn0c+DX8B4UEu2X2
	OP9Qcp7enlO5HGDptWF5sUJ3DYtM2WWrfWLe+BJ1BF7jqFk6iIzGwSBW5tWxXRvm
	k5GWFfn25Vx6K283ARAJiVoJQk+Bu4GqOjVsG9cgfdph6XqAXjszKK6rttCu6Wsv
	Hrpv3nJfEh8kg5xE80moYXNQyKkyA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44gfn585f5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 20:12:48 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50UK8KRn010357;
	Thu, 30 Jan 2025 20:12:48 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44gfn585f3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 20:12:48 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50UJ4q9E013954;
	Thu, 30 Jan 2025 20:12:47 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 44gf93881r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 20:12:47 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50UKClBB18874922
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jan 2025 20:12:47 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EC23458054;
	Thu, 30 Jan 2025 20:12:46 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9450A58055;
	Thu, 30 Jan 2025 20:12:46 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.92.209])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 30 Jan 2025 20:12:46 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-leds@vger.kernel.org
Cc: lee@kernel.org, pavel@ucw.cz, andy.shevchenko@gmail.com,
        eajames@linux.ibm.com
Subject: [PATCH v7 RESEND 0/4] leds: pca955x: Add HW blink support
Date: Thu, 30 Jan 2025 14:12:42 -0600
Message-ID: <20250130201246.292079-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tCKuu0CpFoi3iX6_IJzwT5g8pe3Gzgjw
X-Proofpoint-GUID: t3n6nkDlgtkrMp3HWrm1iLGaP-6BOq-Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_09,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 mlxscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=586 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2501300153

This series adds support for blinking using the PCA955x chip, falling
back to software blinking if another LED on the chip is already blinking
at a different rate, or if the requested rate isn't representable with
the PCA955x.
Also included are some minor clean up and optimization changes that make
the HW blinking a bit easier.

Changes since v6:
 - Fix erroneous return value check of smbus block read

Changes since v5:
 - Use auto-incrementing control register to read all the led selectors
   at once during initialization

Changes since v4:
 - Set duty cycle to fifty percent for blinked LEDs in order to maintain
   the specified blink rate.

Changes since v3:
 - Initialize return value in the blink function
   Thanks Dan Carpenter and kernel test robot

Changes since v2:
 - Split the cleanup patch
 - Prettier dev_err calls
 - Include units for blink period and use defined unit translations
   rather than just a number.
 - Use positive conditionals.

Changes since v1:
 - Rework the blink function to fallback to software blinking if the
   period is out of range of the chip's capabilities or if another LED
   on the chip is already blinking at a different rate.
 - Add the cleanup patch

Eddie James (4):
  leds: pca955x: Refactor with helper functions and renaming
  leds: pca955x: Use pointers to driver data rather than I2C client
  leds: pca955x: Optimize probe led selection
  leds: pca955x: Add HW blink support

 drivers/leds/leds-pca955x.c | 350 ++++++++++++++++++++++++------------
 1 file changed, 238 insertions(+), 112 deletions(-)

-- 
2.43.5


