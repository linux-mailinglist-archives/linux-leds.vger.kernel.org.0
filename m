Return-Path: <linux-leds+bounces-4024-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 028B8A3DCDF
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 15:32:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47E2D189E0F9
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 14:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 680141FCFDA;
	Thu, 20 Feb 2025 14:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y/TiI+DY"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B7E1FCFC9
	for <linux-leds@vger.kernel.org>; Thu, 20 Feb 2025 14:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740061931; cv=none; b=VW1yQxC1FRYjQQWg9iOwi9gtyLL2SMRvkcg3aHOZH1MeO+SjtmNbwI0RCgJB50b/3wkODMHgcyIrUrYQiX5b2eXweBe0o5em96fmCtXpMRzN+i1Kp61ZrB6djjJZUv6OBudfM0n+V/hztHNN5zQ6j8hWBagCyXsQOGFYaYvXBeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740061931; c=relaxed/simple;
	bh=oVkNc7EE3idkZdXhEjaIx+p0Zh9ioUrVNLB3ggVeylk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IWbL8FQSoQ3Lm5Ux7lBeuhDPsymTjcATwcHbnR/y0ehmjMtUt8qk4UMg37GQ62py7Inui4oWndpSGFFEhYeFYIYXee464CoPlsdJUOqVggxC0ZrqXeDkJkXghkwFIvb5S7E2jH1LZXnbmbeKIYtik0mEOPBuO8WlyXFNV6Yleqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y/TiI+DY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD4A1C4CEE6;
	Thu, 20 Feb 2025 14:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740061930;
	bh=oVkNc7EE3idkZdXhEjaIx+p0Zh9ioUrVNLB3ggVeylk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Y/TiI+DYBt5DsuPT+60zFJwQtLM/U2rRiJTeBYIawCUD1tVeeNfyv9ZilkNFdueyg
	 1s3sv3ytp/rduTSgchGosDt+7uSX0XdlX6dQmSIYkp0GW0dVBkPH0H1MXVeok31rQf
	 H135/XSStATGlzxgWRYcsiku40hMVZuANIOPIFBqQzMxtqwN8uPFHKuEqBTBThmuli
	 VaP1i6s++y+XqwlfWW6FGybdbVO9ZXdAhvZm/zqChSdGwQH3B1irHEA1Ydipia9RZY
	 CvIj1SfnYPGD0/mT38EPHskOM2PRzCWIyh3Sve9veBOYz6i/41flx6ITr/HuNzhJYD
	 tJ1FgVid/ratA==
From: Lee Jones <lee@kernel.org>
To: linux-leds@vger.kernel.org, Eddie James <eajames@linux.ibm.com>
Cc: andy.shevchenko@gmail.com, lee@kernel.org, pavel@kernel.org
In-Reply-To: <20250212143038.1416501-1-eajames@linux.ibm.com>
References: <20250212143038.1416501-1-eajames@linux.ibm.com>
Subject: Re: [PATCH v8 0/4] leds: pca955x: Add HW blink support
Message-Id: <174006192944.772603.7002544080664872535.b4-ty@kernel.org>
Date: Thu, 20 Feb 2025 14:32:09 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9

On Wed, 12 Feb 2025 08:30:34 -0600, Eddie James wrote:
> This series adds support for blinking using the PCA955x chip, falling
> back to software blinking if another LED on the chip is already blinking
> at a different rate, or if the requested rate isn't representable with
> the PCA955x.
> Also included are some minor clean up and optimization changes that make
> the HW blinking a bit easier.
> 
> [...]

Applied, thanks!

[1/4] leds: pca955x: Refactor with helper functions and renaming
      commit: ca3362a841b67a23d23c22ac16d18acec6cc75ec
[2/4] leds: pca955x: Use pointers to driver data rather than I2C client
      commit: 1ddab1e2de10a37b66b235cff30e5b0a0beb8809
[3/4] leds: pca955x: Optimize probe led selection
      commit: 14ef0738a31dcecfbba38626884b7d9a60b75cd0
[4/4] leds: pca955x: Add HW blink support
      commit: 575f10dc64a251fc69a3187f4058f272eab94bfe

--
Lee Jones [李琼斯]


