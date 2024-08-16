Return-Path: <linux-leds+bounces-2465-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 389B2954E57
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 18:01:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEC141F25A17
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 16:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 965981BD511;
	Fri, 16 Aug 2024 16:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WFtE8rN3"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D49C1BC9FE;
	Fri, 16 Aug 2024 16:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723824096; cv=none; b=jPeI7OVBb2/0hjaqY9mFVAlRCXQh8RVEG16QOcEf8gyTuA94lSnORopGEMTMmFnTTh/cfuNSljTFG18ytU7Icq5L5QPLAq1cEAfwgrOY4ouliJYPVNCD4dpITqFp9Qn3fNeHrCCAcFM6/lw1TgjNFPxWlo5JpEjLE38bFQjyrYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723824096; c=relaxed/simple;
	bh=CiJGKQa+IE+T3ZkcWX/oy178uqrLN1LuLII+8zj3uH4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XkRQML2NViupRty2Xid4i+Ewaoj9Pd0j69Z2mD21xhTJiX97McnOS4GNoz5snBiEHcM0D1wbuc2yvP6rQJbAP/6o+th/oDu3GorNSUdVSkeWHDIPKTuej75ogQt28It2HHXRMtWVBySB5J/ZbCVPSpd8OU4Wqmz7zVcWInbQ6UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WFtE8rN3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8623AC32782;
	Fri, 16 Aug 2024 16:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723824095;
	bh=CiJGKQa+IE+T3ZkcWX/oy178uqrLN1LuLII+8zj3uH4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WFtE8rN3utss1FjmMnm/yg+HGGxXdTddOxmU6eihRE0cAJ2UM54EXfEx2WCmV1tA8
	 hU+qxnlTzgx5dNfUSn2n8/USL6QMwjH+JDPhwIh06L50cOzqVA54XW5wziX9uqrIeI
	 r3jTZP0IJDfc+BRVrr+MbY91C7wD6T96DgzQ8DutzgiMUs5ZnuauxGfCfW5o9DSzs9
	 FKUSC6WJsQUrnR2RX4u0sn4k1gzGPOEOWe0ol+9RTrJ+dalWBSERhwy3+jSbwU+X4R
	 16DDoWadYBKLSO3LGd1tlKZVT6Maur3beQ5VoJ+OMhDmz0S0aqHOgtuZMCjX1Deuup
	 EWQcVuIGFpG7w==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Isai Gaspar <isaiezequiel.gaspar@nxp.com>, Marek Vasut <marex@denx.de>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240807-leds-pca995x-fix-fwnode-usage-v1-1-8057c84dc583@gmail.com>
References: <20240807-leds-pca995x-fix-fwnode-usage-v1-1-8057c84dc583@gmail.com>
Subject: Re: (subset) [PATCH] leds: pca995x: Fix device child node usage in
 pca995x_probe()
Message-Id: <172382409029.3366296.12169044923782597357.b4-ty@kernel.org>
Date: Fri, 16 Aug 2024 17:01:30 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Wed, 07 Aug 2024 15:37:03 +0200, Javier Carrasco wrote:
> The current implementation accesses the `child` fwnode handle outside of
> device_for_each_child_node() without incrementing its refcount.
> 
> Add the missing call to `fwnode_handle_get(child)`.
> 
> The cleanup process where `child` is accessed is not right either
> because a single call to `fwnode_handle_put()` is carried out in case of
> an error, ignoring unasigned nodes at the point when the error happens.
> 
> [...]

Applied, thanks!

[1/1] leds: pca995x: Fix device child node usage in pca995x_probe()
      commit: 82c5ada1f9d05902a4ccb926c7ce34e2fe699283

--
Lee Jones [李琼斯]


