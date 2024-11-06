Return-Path: <linux-leds+bounces-3306-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEF69BE43F
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 11:28:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED4221C21918
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 10:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168731DDC36;
	Wed,  6 Nov 2024 10:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cSkgsRLw"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD19D18FDA5;
	Wed,  6 Nov 2024 10:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730888928; cv=none; b=vAO3WMJ4Bj7rDaW+qcdNTMPj7OA3/pYJvBAZdWIlaE9oLhc+goCD84+Jji39KBRSTT59YhKyGG+HdCyFjaSvEr44ZOubsaRld/BVHe1l9cwt7KsC0hUoq0oX/A575BPVmEYZOc3hPPlg1TnPlrOB7Dz9FZM2v5EnRaB3WjpDj+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730888928; c=relaxed/simple;
	bh=2W3lHOkrvwwmFq2Br1SOMNGz4j/akgV+dPVRJ5Btkmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kHsBTlh5UBe0bx6Jom5fmw3BiI0v1p9BnASTLz2CyvEV7gSfo6oAxGOxyqQVcFlE3vIX+3dSNzAudIkP3F8Y/QijGisoX61ViILMt7uN0agrJKJmAh7oKYXD6hdiEz0xNyfIf+iPNp+iz4RgiMb/KGQ9ASgEVlYJoutsDZAuo1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cSkgsRLw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C598C4CECD;
	Wed,  6 Nov 2024 10:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730888927;
	bh=2W3lHOkrvwwmFq2Br1SOMNGz4j/akgV+dPVRJ5Btkmg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cSkgsRLwUOmH1VC530NAKtxbFJ7XoNIoJQDmcHIwPdVlIfSuZBlu8Xep+C4E1+Qdi
	 hle6cfWXAIjx/tj56usOZ2gFk1FfO2bpkhHWqNzreiWkO6VQQXHyiUh1Ky3aEcrjq8
	 pYz9YAi/KzCUIVmGXqjM1IvN7IPuoOUHFOGhQm1ROgm1OhsOmd+dSZ3WNaaxseKGIl
	 YaalrsQ0Pxk6L0nWHp9lF/yKe/lk4954It+WnvVMcdSa24ItROsOE1fVP/ADKmXm79
	 UK/jREBk7Xty79/7MncmEfPA6+8tCZWUT1q+6SQW86Up1SXLqHzCjyBPPBI1Nom+6/
	 a6iEKpCEoEr7w==
Date: Wed, 6 Nov 2024 10:28:40 +0000
From: Lee Jones <lee@kernel.org>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>, arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH leds v5 01/12] turris-omnia-mcu-interface.h: Move command
 execution function to global header
Message-ID: <20241106102840.GN1807686@google.com>
References: <20241104141924.18816-1-kabel@kernel.org>
 <20241104141924.18816-2-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241104141924.18816-2-kabel@kernel.org>

On Mon, 04 Nov 2024, Marek Behún wrote:

> Move the command execution functions from the turris-omnia-mcu platform
> driver private header to the global turris-omnia-mcu-interface.h header,
> so that they can be used by the LED driver.
> 
> Signed-off-by: Marek Behún <kabel@kernel.org>
> ---
>  .../platform/cznic/turris-omnia-mcu-base.c    |   1 +
>  drivers/platform/cznic/turris-omnia-mcu.h     | 130 -----------------
>  include/linux/turris-omnia-mcu-interface.h    | 136 +++++++++++++++++-
>  3 files changed, 136 insertions(+), 131 deletions(-)

Who needs to Ack this for me to take it via the LED tree?

-- 
Lee Jones [李琼斯]

