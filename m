Return-Path: <linux-leds+bounces-271-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 363EA8070F3
	for <lists+linux-leds@lfdr.de>; Wed,  6 Dec 2023 14:32:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 687171C20AB4
	for <lists+linux-leds@lfdr.de>; Wed,  6 Dec 2023 13:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A81F239FDC;
	Wed,  6 Dec 2023 13:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PP2wvEtX"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8683118AFB;
	Wed,  6 Dec 2023 13:32:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24687C433C7;
	Wed,  6 Dec 2023 13:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701869559;
	bh=87DeOzN+H+/ZblXZmRyco22+Ti8CYuCGBYv8nG8F4lE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PP2wvEtXRXqJcfTNN6HC/ncsZItCFqmirJK+fJzyVs3Dt6dh04Mu9BXTcnPNtUApH
	 nfiq+ZgRFWZxx5jlZYEjNR6VzHdUs/iO3tfhY/fJ3XYyGX6NpVmAtNMtXwcWXJoTnx
	 F/vyenqT4k80NZsqAbtCU1SZJgO3/lzvZkVrEYLi9X7KahVWZc5uxmBvEHoOF3AzYp
	 Cg60xXENRqgEYNuZXqBTLokDFp05tNEZgvMZYOoeaFZju2ep3EU4CzCr2ZDhtV2hXS
	 KYUHNQT1j4NUNO+0xMfAU+LR1Rn+ABAhUNrgL5UGz/oVO9Z+wGmFLPVBE2L1x29iKw
	 ItEpA9y9aoKBA==
Date: Wed, 6 Dec 2023 13:32:34 +0000
From: Lee Jones <lee@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Heiner Kallweit <hkallweit1@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH v2] leds: trigger: netdev: fix RTNL handling to prevent
 potential deadlock
Message-ID: <20231206133234.GD3375667@google.com>
References: <fb5c8294-2a10-4bf5-8f10-3d2b77d2757e@gmail.com>
 <20231204144808.26083e8a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231204144808.26083e8a@kernel.org>

On Mon, 04 Dec 2023, Jakub Kicinski wrote:

> On Fri, 1 Dec 2023 11:23:22 +0100 Heiner Kallweit wrote:
> > When working on LED support for r8169 I got the following lockdep
> > warning. Easiest way to prevent this scenario seems to be to take
> > the RTNL lock before the trigger_data lock in set_device_name().
> 
> Pavel/Lee, would you like to handle this patch?
> Or should we ship it to Linus on Thu?

Go for it.

Acked-by: Lee Jones <lee@kernel.org>

-- 
Lee Jones [李琼斯]

