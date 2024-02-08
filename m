Return-Path: <linux-leds+bounces-780-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD7D84DE61
	for <lists+linux-leds@lfdr.de>; Thu,  8 Feb 2024 11:33:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD179280E95
	for <lists+linux-leds@lfdr.de>; Thu,  8 Feb 2024 10:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8713F1E528;
	Thu,  8 Feb 2024 10:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SLJRQDLO"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C151DFF2
	for <linux-leds@vger.kernel.org>; Thu,  8 Feb 2024 10:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707388425; cv=none; b=eGXzsTMG1T4icp8Fk2mrcAysV64dfI60VSWbGEepp7R+Em8JRCME9GNHIMYHe9Z+KBq7jDV1kinRxpZBN3t0bYEunJR4ZtAo4T+0c3lz+tQNGQ9W3CJiK5FEWHW5h5p6nL8X5Urx1VhCuGUzDQ0AqtixO2I4t8dd+u15igWhcdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707388425; c=relaxed/simple;
	bh=T9INdNEfFupVhduUogQ9xtJ9TxQfb42wKyBU6dp3YfE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l/+2oa3WN1cMdlbqs8/xBoMa/4xWaWuCBP/i6gy6Q5H6nm/h0k3erlzkDVeXL9M8oA7YrYZksynjTSgAl9+UnY93wCqUclQJZsiKPfRRPNGREqnyKBK6AM4rHT3/xC0qfgh/imAETpTQxG2GwQ4XvBFnlnOdiQt+Bf7B9Di0xj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SLJRQDLO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF88BC433F1;
	Thu,  8 Feb 2024 10:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707388424;
	bh=T9INdNEfFupVhduUogQ9xtJ9TxQfb42wKyBU6dp3YfE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SLJRQDLO1NJa78TSWMIgWpQoDQCuk40mA3LGGpXPZU+Rbue7423RVEvj9OnisYRcB
	 j/zyKTnu18DuReEDPCuqinJZcXiktYfOpGPe1kxze+ugAXEqq/gtp+riLb+og3zghM
	 h/d70dOVwCbUHw/9U9TRv6FLdG1R1Ks0OeYVlmYwCTUkWAk/qjF1qLrh8kmHMxAjf6
	 0Dk1G6tJGGyePYJm3BB3rE6KCug+DRy3dcp5ISYVw3ec1eSyAIyJDSXF7eSEmT3LVg
	 urEbzY7JPBqsvQRzU4VLve4hMxltfP/xsWNoOdQOQY8M8fNQwKmCpDO5+hTLW1tNv2
	 VgObHYaaxjiTA==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-leds@vger.kernel.org
In-Reply-To: <d78eef6f-c18c-4546-b83e-6d1890849154@gmail.com>
References: <d78eef6f-c18c-4546-b83e-6d1890849154@gmail.com>
Subject: Re: (subset) [PATCH] leds: triggers: Add helper
 led_match_default_trigger
Message-Id: <170738842361.913041.10928398087193620217.b4-ty@kernel.org>
Date: Thu, 08 Feb 2024 10:33:43 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Wed, 31 Jan 2024 15:33:08 +0100, Heiner Kallweit wrote:
> Avoid code duplication and factor out common functionality to new
> helper led_match_default_trigger().
> 
> 

Applied, thanks!

[1/1] leds: triggers: Add helper led_match_default_trigger
      commit: 2953ce75e09a64a0e693367a686f5c68ac3a44f2

--
Lee Jones [李琼斯]


