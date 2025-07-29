Return-Path: <linux-leds+bounces-5158-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25020B14753
	for <lists+linux-leds@lfdr.de>; Tue, 29 Jul 2025 06:51:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A0E01AA0E10
	for <lists+linux-leds@lfdr.de>; Tue, 29 Jul 2025 04:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8B5E22D9E3;
	Tue, 29 Jul 2025 04:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uubVqkPQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA58D1E0E1F;
	Tue, 29 Jul 2025 04:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753764687; cv=none; b=TRG7/5LCpALDHm3b/s+Ijkv8zDI3ATARFNybw6FJ+D4ODM3CclPQ+BwBBIRnbXZkTMiuVxOhl+c1gMGGisYrBG111SdcIUq6inXptGL6tQsi0/OPQ5OHq9O3dZOXp/qpSPmfvBepHZBrOqL6rygT1PNyUIsemKxcfQfDB+hpCw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753764687; c=relaxed/simple;
	bh=dKYGSCbks/KUDflV6ussEDmTnM88IuSNnO/6SfSJ1v4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SHWAQyd50KydNts8ImsV8PJWkFt5wgsdUkj28GQHHVfsN//rRynHDtgmY5SEFs558H1F5xXRaNhQw2rSmNkFfLzVCai/UvlYSNUoZSThwaj+0gYtpp/q0kg4nWIt1CKfWCMmDNO/QSw62Tu0uOSFfakxuL6CwqAV8JEjLqGZL3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uubVqkPQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4EBC6C4CEEF;
	Tue, 29 Jul 2025 04:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753764687;
	bh=dKYGSCbks/KUDflV6ussEDmTnM88IuSNnO/6SfSJ1v4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=uubVqkPQoKz0J3lyriL2V0UX3htgCq+DQ51i8QnLqyDF8sgeP7gt75mRYvVe3QMwy
	 P/GGX+WVn49TrO5ao78yjx0+AvsnwraUgVVG0cx9SgWN6OB6hp8DMkG9VTW+WLJCAt
	 zWNbC/1Ml/oEKZRiHqLtweKRacop6k2V2zP353EdenozvFkcds7Tod4ycKqEwRk82r
	 S2YN6GMNzrRQAL0r6es4LNxfT1ez7BsMGPDSdTqIy0oftspSmf+vXSoi4/PlBwdQuv
	 dXNcjk7VxNCZNjhJjcWPmcciLp03dPVUu3y13+Ed/pu8xtLDmsPLPbmftZm403lGbq
	 TmQafMflpIf8Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE21C87FC9;
	Tue, 29 Jul 2025 04:51:27 +0000 (UTC)
From: Fenglin Wu via B4 Relay <devnull+fenglin.wu.oss.qualcomm.com@kernel.org>
Subject: [PATCH v2 0/2] leds: flash: leds-qcom-flash: update torch current
 clamp setting
Date: Tue, 29 Jul 2025 12:51:21 +0800
Message-Id: <20250729-fix-torch-clamp-issue-v2-0-9b83816437a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAElTiGgC/4WNTQ6CQAyFr0JmbQlUkMSV9zAs6likCTA4FaIhc
 3crF3Dzku/l/WxOOQqrO2ebi7yKSpgM8JA539P0YJC7scMC66LBGjp5wytE34MfaJxBVBcGT1h
 jiUSIlbPuHNmC++61Ne5FrfTZb9by5/5bXEsooPLdkW9ElT81l6CaPxcafBjH3MS1KaUvXmf1f
 sEAAAA=
X-Change-ID: 20250725-fix-torch-clamp-issue-ca25212aa224
To: kernel@oss.qualcomm.com, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753764686; l=1056;
 i=fenglin.wu@oss.qualcomm.com; s=20240327; h=from:subject:message-id;
 bh=dKYGSCbks/KUDflV6ussEDmTnM88IuSNnO/6SfSJ1v4=;
 b=p9Dd8qj3QnbN00t2Peuil908E+TcycfB7gOqALi/uoCKxFI5+XdLiGUtTL2g7bhMGPcekUA2B
 V7TY8+rRf1GA86fo54pMZ1XRpqjVV2ljD9Ol9VD0QtVMOMQwpz2lWbH
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=BF8SA4IVDk8/EBCwlBehKtn2hp6kipuuAuDAHh9s+K4=
X-Endpoint-Received: by B4 Relay for fenglin.wu@oss.qualcomm.com/20240327
 with auth_id=406
X-Original-From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Reply-To: fenglin.wu@oss.qualcomm.com

There is a current clamp register needs to be updated when enabling
torch LED, and the register address is different between different
PMIC flash LED modules. Add changes to address it.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
Changes in v2:
- Update the register mapping to use designated initializers and ensure
  they are sorted by register address.
- Update the 'msb' of 'status1' register to 5 for pmi8998 flash LED
  module
- Link to v1: https://lore.kernel.org/r/20250725-fix-torch-clamp-issue-v1-0-4cf3ebaa4c67@oss.qualcomm.com

---
Fenglin Wu (2):
      leds: flash: leds-qcom-flash: update torch current clamp setting
      leds: flash: leds-qcom-flash: add a separate register map for PMI8998

 drivers/leds/flash/leds-qcom-flash.c | 87 +++++++++++++++++++++++++-----------
 1 file changed, 60 insertions(+), 27 deletions(-)
---
base-commit: 4903924ac7ef31fbbe48b3261b1bc86ce6cd7e97
change-id: 20250725-fix-torch-clamp-issue-ca25212aa224

Best regards,
-- 
Fenglin Wu <fenglin.wu@oss.qualcomm.com>



