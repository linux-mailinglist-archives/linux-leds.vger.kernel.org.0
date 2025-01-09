Return-Path: <linux-leds+bounces-3742-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B2AA07438
	for <lists+linux-leds@lfdr.de>; Thu,  9 Jan 2025 12:09:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FAA63A6D08
	for <lists+linux-leds@lfdr.de>; Thu,  9 Jan 2025 11:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B7E72153FE;
	Thu,  9 Jan 2025 11:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uiW7Kzug"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C2E1714D7;
	Thu,  9 Jan 2025 11:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736420961; cv=none; b=Hhtx+6PoV/MWMPwltDWu29AUwDKbTRzTWa/Xxk3HpFlXY4Hxdo/XswbY2YwK8AvZWPEBcAu8M1AROTVXyUtGiMu3dHbrULjCkUFmU2mDhVxdZcqAs3GoP/Fwz8dEF7/LZc5DcEiY516doWk45uVKedZXwr5VG2dLgcmQSu7RQG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736420961; c=relaxed/simple;
	bh=7Yy2wVxBz5cvwj/N3LZZbexrofwkTNk3p/5JlREl/rw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Tq5IsaVAOS2m4UIceAeFMlyHm1HHAG9V5nzfnsOjsDbVYUh4S1K3ZR5vvOqi7+3dlHtuMGQipK328BVb5nWMfXgXRUx1sjrhzj9nUSpV+RRLIENl1eDQ5yQc0H6O7grI1WR0eQ1Qi1AyFgMRRW1KS1maTxgU+3SmHu6P+BbInjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uiW7Kzug; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E31BEC4CED2;
	Thu,  9 Jan 2025 11:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736420960;
	bh=7Yy2wVxBz5cvwj/N3LZZbexrofwkTNk3p/5JlREl/rw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uiW7KzugbEv3pm5TyR8yK3ol0OjCccS1vASbS4jF3L6mKdH4CQAZmuZFTjPRzsvnD
	 GM59+Mnj9OdvwHKi6ZiX+5k62tE82Y60uUmSnZDKwdWpG+OuxPTceY83spZrjyWkd8
	 SzypzODyovZv72AeTvSS8uAGRzb96Q9aHTRasOXl3zuAIi28w2vIzepEHZZ49hIvRE
	 b+39iDTqqat7fsdp1UHCxuzhsOaOjq6z7uGPR02IwmbZLJl0G4DNbzPcOfbtxkVtTR
	 V1Dn+Z2pn4li+we87bwlaarMAVyT8mWbNpBYCmi5mGx+csHJsRiJ5XpoGJkQLY4MPQ
	 3xQXC3v2PbOlA==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241222-sysfs-const-bin_attr-led-v1-1-ecc5212a31fa@weissschuh.net>
References: <20241222-sysfs-const-bin_attr-led-v1-1-ecc5212a31fa@weissschuh.net>
Subject: Re: (subset) [PATCH] leds: triggers: Constify 'struct
 bin_attribute'
Message-Id: <173642095967.2597405.10139417542896220345.b4-ty@kernel.org>
Date: Thu, 09 Jan 2025 11:09:19 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Sun, 22 Dec 2024 21:04:50 +0100, Thomas Weißschuh wrote:
> The sysfs core now allows instances of 'struct bin_attribute' to be
> moved into read-only memory. Make use of that to protect them against
> accidental or malicious modifications.
> 
> 

Applied, thanks!

[1/1] leds: triggers: Constify 'struct bin_attribute'
      commit: daefd7fbd544671ad0b9c2a815d7f5e3d2f0365c

--
Lee Jones [李琼斯]


