Return-Path: <linux-leds+bounces-5124-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60010B11B84
	for <lists+linux-leds@lfdr.de>; Fri, 25 Jul 2025 12:04:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8711D5863AA
	for <lists+linux-leds@lfdr.de>; Fri, 25 Jul 2025 10:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F47E2D4B5A;
	Fri, 25 Jul 2025 10:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oP9L8Sm4"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0792C242D6E;
	Fri, 25 Jul 2025 10:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753437858; cv=none; b=ly4t2mfTTlK9gISPanca7cohX4lKAiO0F1k1irFi0O98QecK7DJ+/VYeKqYSuXuE8ai8+NZgWo7fjwFu8V6nPOD0RvC54lITza29SRZU53t1PCEq/chn8qxX2h/xUvJEaBn8MBx1b9YjTlXHrOlBXep/DTYhwouO5x6iv1kQBe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753437858; c=relaxed/simple;
	bh=SHpZYFN+ikBn9ViyXM+75AUWEhtspSgSY6IAV+p9ryM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rNpNuxAIerDmXgZ9E+SXhpPhC/o4vd71QvrH+u4tW+zyA0WCFhyQLgG/c27nsXP6btMWLBvZNYc733bWZAUcrjJJUamv+N7HnIXenRjQeH40fS41asqW/Roq6MsoMEw75tLunHm0pPAUz4y3mjQdNKf1w3bb9c7CU6Zo/NuhSCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oP9L8Sm4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9AEF6C4CEE7;
	Fri, 25 Jul 2025 10:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753437857;
	bh=SHpZYFN+ikBn9ViyXM+75AUWEhtspSgSY6IAV+p9ryM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=oP9L8Sm4k04iqJSP5Z3KyVx33Dqc1GstbsQ/74DgM2nPvMFUuY0PB29EQjzoqpF1n
	 YgAlQgdBcWVf8eURggqEg9lwxBa9MXbU7AmlU3zR5n5xUTvQJRvZGh0dwxsas7e2fl
	 +cAWsDWF3G82LSEjjevcg6rz+muFKlSWA6egcaYfSVOtjggtqccmM4NjLzNnhFMFAv
	 W4Em6w9ndqbCb1RqrSdJvDuX/WRpBmZY2Lm6pdWcMi21dXy9MfjLT5nmm+KwLO0AMs
	 OyCf/UwBw0hunyT9eCrVToGwjkbIEJ88rgne6FIJiOFoNPkwV1v2ZJJQNeWVdczE9C
	 s9HD7h2xW2AOQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82CC6C87FCA;
	Fri, 25 Jul 2025 10:04:17 +0000 (UTC)
From: Fenglin Wu via B4 Relay <devnull+fenglin.wu.oss.qualcomm.com@kernel.org>
Subject: [PATCH 0/2] leds: flash: leds-qcom-flash: update torch current
 clamp setting
Date: Fri, 25 Jul 2025 18:04:02 +0800
Message-Id: <20250725-fix-torch-clamp-issue-v1-0-4cf3ebaa4c67@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJJWg2gC/x2MSQqAMAwAvyI5G6jBIvgV8RBq1IAbjYog/bvF4
 8DMvGASVQza4oUot5ruW4aqLCDMvE2COmQGcuRdQx5HffDcY5gxLLweqGaXYGDyVBEzUQ25PaJ
 k8f92fUofXhFmo2cAAAA=
X-Change-ID: 20250725-fix-torch-clamp-issue-ca25212aa224
To: kernel@oss.qualcomm.com, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Fenglin Wu <quic_fenglinw@quicinc.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753437856; l=733;
 i=fenglin.wu@oss.qualcomm.com; s=20240327; h=from:subject:message-id;
 bh=SHpZYFN+ikBn9ViyXM+75AUWEhtspSgSY6IAV+p9ryM=;
 b=lHYmwcmrhp6R+lF5W5Lz1phwfYVbW+JEVJAYsqUQ7FhtriLhZ6fqHBQs4FQTVbd3pwaOztg84
 ykPPgCPMljBCiOyT7mjuqeCbykNXqf1wWGFLZ62HL0iEkphAAhrzcjr
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
Fenglin Wu (2):
      leds: flash: leds-qcom-flash: update torch current clamp setting
      leds: flash: leds-qcom-flash: add a separate register map for PMI8998

 drivers/leds/flash/leds-qcom-flash.c | 41 ++++++++++++++++++++++++++++++++----
 1 file changed, 37 insertions(+), 4 deletions(-)
---
base-commit: 4903924ac7ef31fbbe48b3261b1bc86ce6cd7e97
change-id: 20250725-fix-torch-clamp-issue-ca25212aa224

Best regards,
-- 
Fenglin Wu <fenglin.wu@oss.qualcomm.com>



