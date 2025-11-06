Return-Path: <linux-leds+bounces-6026-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EB210C3CA4B
	for <lists+linux-leds@lfdr.de>; Thu, 06 Nov 2025 17:57:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 654B3502D22
	for <lists+linux-leds@lfdr.de>; Thu,  6 Nov 2025 16:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B04A33B964;
	Thu,  6 Nov 2025 16:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jnxosHox"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E86C334C24;
	Thu,  6 Nov 2025 16:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762447975; cv=none; b=TGhHtlrTIVQHgMo2WZ4jcwvUxx6zdHxVNqjgcOAUAp2ARcjD32ljQB1VWgpVRhUZ2qVdy+OBTpYXBDhyJc1zhcOMKJ+AiUBGPJ85fjh2lDaHZXnp1967PEeBJ+MgRYUYKJRELoIexhRAJqVvHJUwmcuHgDpf7ndO5vLhPwmmvcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762447975; c=relaxed/simple;
	bh=dIyMUhdYzSO4klL+M2Wm/feXCZVTk+vDwb5pQv1QcSc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Cx+DxV5W7s+r4+U2HfIAYHyuKhtS7D8+WkaLeYXS9bmO3HxurHqRpQoAUQRhJjhEiY4Vx2e6rKoSfb2QxQh6QoDfaM4ZwG9HGFO3SsTnD3UZVlFLbM/jNJT/rCT84wmv1NlAxw9Ogogmdx6tChVl5OvlAYH7IBCRLprsOteyZLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jnxosHox; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0087BC4CEF7;
	Thu,  6 Nov 2025 16:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762447974;
	bh=dIyMUhdYzSO4klL+M2Wm/feXCZVTk+vDwb5pQv1QcSc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jnxosHoxmtBQd7FCskiWs8SjJVKHWAiEZk9jDINuiwGhS8XNOHwBdbgweuqYGfwNL
	 aFOeDwu2F8XZN9hx2vUS96NNzUMAkRP1bU/cJ2paueKkMVOvE7CFv2VX8REs9EHaf6
	 MXRqzdPtzLHShM2DN00yjVCLvrwf8MoLS4I640uTRE5Q09Vc4NfXZS3X5+7c9Kc37w
	 bnoAWt3okBsH8oWFwzTBjAr/7asS3mCkBAhUwLRdnauPEJpwfjympSrkYe9wFJkO1h
	 hP8Gd+QNUcJ1431MS0+T0L6c/1EDn4jGeiYjfLUwdENGzmi7CsBa5cdGI7VsSs/Qhd
	 2r/l2pMcXhdvQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-leds@vger.kernel.org, chrome-platform@lists.linux.dev, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20251028-cros_ec-leds-no-colors-v1-1-ebe13a02022a@weissschuh.net>
References: <20251028-cros_ec-leds-no-colors-v1-1-ebe13a02022a@weissschuh.net>
Subject: Re: (subset) [PATCH] leds: leds-cros_ec: Skip LEDs without color
 components
Message-Id: <176244797270.1955851.7712074891056264221.b4-ty@kernel.org>
Date: Thu, 06 Nov 2025 16:52:52 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Tue, 28 Oct 2025 16:31:03 +0100, Thomas Weißschuh wrote:
> A user reports that on their Lenovo Corsola Magneton with EC firmware
> steelix-15194.270.0 the driver probe fails with EINVAL. It turns out
> that the power LED does not contain any color components as indicated
> by the following "ectool led power query" output:
> 
> Brightness range for LED 1:
>         red     : 0x0
>         green   : 0x0
>         blue    : 0x0
>         yellow  : 0x0
>         white   : 0x0
>         amber   : 0x0
> 
> [...]

Applied, thanks!

[1/1] leds: leds-cros_ec: Skip LEDs without color components
      commit: 4dbf066d965cd3299fb396f1375d10423c9c625c

--
Lee Jones [李琼斯]


