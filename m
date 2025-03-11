Return-Path: <linux-leds+bounces-4220-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2E4A5B5E1
	for <lists+linux-leds@lfdr.de>; Tue, 11 Mar 2025 02:32:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68C51170978
	for <lists+linux-leds@lfdr.de>; Tue, 11 Mar 2025 01:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B0D72AD04;
	Tue, 11 Mar 2025 01:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mcqueen.au header.i=craig@mcqueen.au header.b="AT1JhkF0"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539BF5258
	for <linux-leds@vger.kernel.org>; Tue, 11 Mar 2025 01:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741656717; cv=pass; b=r8uFN0E9LWbgoOjs5yvR6GCLhfvks+gobA6as74FHnM8g26XqTO3vyPoGAuM9Qy2qZ4GJbWFyd20NaCaDw0QW5u8R6GokYDTcO+W9Jxc19lb0rV0hfBMRWCMUxRK2dFmOORDgBk+T1rHU/HwEFt0/YYx5YDQFGXRDPccFr52A9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741656717; c=relaxed/simple;
	bh=LSMCgpWTFasfp9l5VKL/D5o9zDnwsKoDkOvhfFF5KgE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ffn8UkYnCFk52efWWf3NCCGUjSkpMTqXF0KIacRItqsie9eW84+uLjvsS1yPtMWYRn3xlpbCzOnGE41lKqV5yTBRXswn29b/bMnizKfwA5HPIdLTG0/YGm7txXNjOOId9LlBcb3QI3T50OukPTRUdjo0Bv/yArkKzhX1OHCJZJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mcqueen.au; spf=pass smtp.mailfrom=mcqueen.au; dkim=pass (1024-bit key) header.d=mcqueen.au header.i=craig@mcqueen.au header.b=AT1JhkF0; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mcqueen.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mcqueen.au
ARC-Seal: i=1; a=rsa-sha256; t=1741656713; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UyoJD+MulFJ/SbuaV81cvxE6SZxQMgwr4B2cuxCZGPmKmaIGAG2dx7Jt1SC20iQbpb35EavqHlz4jzHDr7EirduPO+jvW7AIuM2qwLYxiVXdyJLHxYafMvFw1udMh5NmukVeZo5Uq/ol6DWowNe/c8oqe2WKiDDm4fm1p04vC/Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741656713; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gXkoJz0BHEpL72MVOldGyUT4FDBdKpJJR0DuMpisB80=; 
	b=Jq+v/maLM/o3mkFJRPxx5AdEKeKAc6JJbHPZ5eOI8l0b4Qccv1Ra8l8YphKPBWgMX+HGsGhXsl0arPI0c5gxNx9nc9uWsEWFMVevCQz8+1MUEJCSnoolWV3cLqYkZvdiOxu7S65xlW3/4tjxLJ033sie1NYZVIh5xuvsB5mRjYE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=mcqueen.au;
	spf=pass  smtp.mailfrom=craig@mcqueen.au;
	dmarc=pass header.from=<craig@mcqueen.au>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741656713;
	s=zmail; d=mcqueen.au; i=craig@mcqueen.au;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=gXkoJz0BHEpL72MVOldGyUT4FDBdKpJJR0DuMpisB80=;
	b=AT1JhkF0g0eKsU9SM65s42qvELCqLVz51O50V5lHiGvPE3t7i8ycuLefbTD5vRiJ
	bHyZGsaiKPGaSeL9VX+FXEb4ZgPLfs54SVzh6zejTiC2AMmgcjAmwwzKQfsPApLIzdb
	+Vvs36A9asW8HMbLqJAhRh5EQNG5G2acQQCXVGyM=
Received: by mx.zohomail.com with SMTPS id 1741656710141657.3336224073742;
	Mon, 10 Mar 2025 18:31:50 -0700 (PDT)
From: Craig McQueen <craig@mcqueen.au>
To: linux-leds@vger.kernel.org
Cc: Craig McQueen <craig@mcqueen.au>
Subject: [PATCH v2 0/1] Introduce userspace LED triggers driver
Date: Tue, 11 Mar 2025 12:28:06 +1100
Message-ID: <20250311013143.371930-1-craig@mcqueen.au>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

I've done some significant rework since my original submission of this.

* Moved and renamed driver to drivers/leds/trigger/ledtrig-user.c, 
following kernel arrangement of trigger drivers.
But note the char device name and uapi header file are still named 
'uledtriggers'.
* Fixed a mutex reentrancy issue with the 'activate' function.
* Code refactoring and add comments.
* Add new documentation page to index.

Craig McQueen (1):
  leds: Introduce userspace LED triggers driver

 Documentation/leds/index.rst        |   1 +
 Documentation/leds/ledtrig-user.rst |  36 +++
 drivers/leds/trigger/Kconfig        |  10 +
 drivers/leds/trigger/Makefile       |   1 +
 drivers/leds/trigger/ledtrig-user.c | 348 ++++++++++++++++++++++++++++
 include/uapi/linux/uledtriggers.h   | 123 ++++++++++
 6 files changed, 519 insertions(+)
 create mode 100644 Documentation/leds/ledtrig-user.rst
 create mode 100644 drivers/leds/trigger/ledtrig-user.c
 create mode 100644 include/uapi/linux/uledtriggers.h

-- 
2.48.1


