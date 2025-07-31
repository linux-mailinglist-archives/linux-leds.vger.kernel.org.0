Return-Path: <linux-leds+bounces-5176-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 750F3B16FA6
	for <lists+linux-leds@lfdr.de>; Thu, 31 Jul 2025 12:33:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E157E18886E3
	for <lists+linux-leds@lfdr.de>; Thu, 31 Jul 2025 10:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1A7720C461;
	Thu, 31 Jul 2025 10:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AmI8Ysb2"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA49202F7C;
	Thu, 31 Jul 2025 10:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753957975; cv=none; b=ZUl007Z2U+4CFfgfp2is00JExdFR8x6tnu19hku5Ae+ofcMhBf/Kx4I+jb5t6I/HUFMCKVESTH71dKF2qrK6VSG6Fx0au80MEDpEryIMJC3Kbj2ym+3tNSMWalFyF6rTZ3jciSzVqe0/aV9yy0Ud79AVuVEtuMCb/xY4FJvL/Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753957975; c=relaxed/simple;
	bh=7TYs1DXD+RLIWiRg5nojhi0kwjEpOoYROGf5urIvGmA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PazD+iUog08ViaIKYB5StXfFsrR69kMpWOylVNkb18wqZLo9R1+YnW/V7vPhLQCR5lcKhmJ1yy/EV8wMEak7P4PYjeKYTUtkp4pmdUb0MNa6tzFEY4ap0KGMWMP94j9UduliUYFC0jTong5NwH8DqxI+GXpgD2jgqik9lfsMvfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AmI8Ysb2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 582A6C4CEEF;
	Thu, 31 Jul 2025 10:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753957975;
	bh=7TYs1DXD+RLIWiRg5nojhi0kwjEpOoYROGf5urIvGmA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AmI8Ysb2bAw3DkcrKNhGVnbdA1g5NpsTuYcn/Kj1XW152JQ85HgoXkoqk1+R2DRER
	 qzPk/x3TeM3Utj5MpPq5mfOtkNYK13TZE1atDCtGpBMmBTBWNY9ynOSfVlOdPwlFuZ
	 JPUOWhUPaGqcEI4kxoHlydvDduGKRjll5dZR1zuCK0hjbJuZxvsG3tDJ1VXHto1yNb
	 vsJTQLq3e/Ri7ToVRqsPb/sRBi/hocIZ1Bww9LKjXNiQGHZgY/ZXG+s1YSQ1HnfR96
	 7peqnj9DMQQ1RNolL6ixgMWVLBkQqY4DSk2DjcuMkGQhGVf0vfdaGdB+TGMoO+t9NU
	 1naiVcYIQ/NCg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org
In-Reply-To: <20250723-leds-is31fl3236a-v6-3-210328058625@thegoodpenguin.co.uk>
References: <20250723-leds-is31fl3236a-v6-3-210328058625@thegoodpenguin.co.uk>
Subject: Re: (subset) [PATCH v6 3/3] leds/leds-is31fl32xx: add support for
 is31fl3236a
Message-Id: <175395797309.1116766.2132197180536209692.b4-ty@kernel.org>
Date: Thu, 31 Jul 2025 11:32:53 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Wed, 23 Jul 2025 11:02:08 +0100, Pawel Zalewski wrote:
> Add an additional and optional control register for setting
> the output PWM frequency to 22kHz. The default is 3kHz and
> this option puts the operational frequency outside of the
> audible range.
> 
> 

Applied, thanks!

[3/3] leds/leds-is31fl32xx: add support for is31fl3236a
      commit: 7e676ac3d8a958fb149f4d21de5a7008ab0d651b

--
Lee Jones [李琼斯]


