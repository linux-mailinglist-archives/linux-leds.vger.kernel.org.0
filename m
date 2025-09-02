Return-Path: <linux-leds+bounces-5353-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B497BB3F71D
	for <lists+linux-leds@lfdr.de>; Tue,  2 Sep 2025 09:55:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A60C1A86186
	for <lists+linux-leds@lfdr.de>; Tue,  2 Sep 2025 07:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FDCF2E7196;
	Tue,  2 Sep 2025 07:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UruS2akV"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0FE1F428C;
	Tue,  2 Sep 2025 07:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756799706; cv=none; b=Bia5itrurdsHx/y0QNm+NII/sxtp2gB+vgIzK5N97f1uoFhx8oi4OJ+bVWkw3VOqkk8uptP7IQj5SzDrPKREf5B6FQPrApsH8AUY1F9wGX6VdtBGSxilXUQJYJ3+4PTPy/LV985ODKt8MSlhxd3zTSydgxGAdATkbAyVnmb5QCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756799706; c=relaxed/simple;
	bh=0p061QRlRRPPqydkyrHzuZtRorsNAvt9HktQjzeHQzU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DMNYotC8KZImkYbn5y5F3fUMrGCtGzNI50uycrd+TPvgyecmr/8UOU9Y/xM5YkZ1pTiCMABi0BS8gl9hONawObwW+ANNhOrv9ceacYMKJBmOFZDTEDXCSPWX1Zdzqy1lSVfQqap68SBqENjXZ0J+c62Nns0brednQ2UIkP22O4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UruS2akV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10B0DC4CEED;
	Tue,  2 Sep 2025 07:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756799705;
	bh=0p061QRlRRPPqydkyrHzuZtRorsNAvt9HktQjzeHQzU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UruS2akVo04rXgp9tUKoNLHh/5qKH56PPMBY/VU/899YbddkqaVpcGxDsG4eh9sg1
	 hb4f6Y18ahIQZYuSmtWZYO5p8nkb0sGY8x16i9RK0N1ay0Y9nRpSEON0tIiQVjhWnf
	 EyX/1WGCNnOq7CLNtXQvipCcSGSp+bd/6MLp92iTUhbQwIS8y9W1EsQTJtEACS5B2d
	 CRg8zPS+GgoZnTMOV6yEAi8klUXlImCfKvAG7qztXGtShgNrpvWL1gGocjmDSd5t+B
	 3DU5Bxa3F0ssUPZ8An33ncJCq/5VsT9TpRxqI0AKRwUsyUA470ITvCdxn0jm1S5L/N
	 Qjb0o/yRslA1A==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, pavel@kernel.org, Heiko Stuebner <heiko@sntech.de>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250804114949.3127417-1-heiko@sntech.de>
References: <20250804114949.3127417-1-heiko@sntech.de>
Subject: Re: [PATCH v2 0/2] qnap-mcu: add support for the status LEDs
Message-Id: <175679970380.2171571.14542632250516080528.b4-ty@kernel.org>
Date: Tue, 02 Sep 2025 08:55:03 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Mon, 04 Aug 2025 13:49:47 +0200, Heiko Stuebner wrote:
> Add the status LED controlled via the MCU and clean up the usb LED
> a tiny bit.
> 
> changes in v2:
> - add patch to clarify the command "area" of the usb status LED
> - captilze LED in text areas (Lee)
> - use 100 chars to prevent some line breaks (Lee)
> - added the newly found state for "both on"
> - don't forward declare struct, instead just point both LEDs to
>   the red one, to allow resolving the parent struct and shared
>   setter functions
> 
> [...]

Applied, thanks!

[1/2] leds: qnap-mcu: fix state numbering for usb LED
      commit: fe4ffdbab4bb3cda1d72b93f7d2c3f7ea3df415d
[2/2] leds: qnap-mcu: add support for the red and green status LEDs
      commit: c2d5d8f247049e22ef0afe8188cf8a6430144a17

--
Lee Jones [李琼斯]


