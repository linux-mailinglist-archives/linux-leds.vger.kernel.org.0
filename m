Return-Path: <linux-leds+bounces-4457-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B863A855B4
	for <lists+linux-leds@lfdr.de>; Fri, 11 Apr 2025 09:44:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1C8C7B0D5E
	for <lists+linux-leds@lfdr.de>; Fri, 11 Apr 2025 07:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4123028EA65;
	Fri, 11 Apr 2025 07:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e9bFFkBq"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DE928EA47;
	Fri, 11 Apr 2025 07:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744357466; cv=none; b=WKn63zV0ldBynLGHH3JWOaCmIJOMVHMC+OEBHXY4/87AIoeYIoJtX11IkBzMwtiKTb1uCI7pxt18tEyvLzxXRmdcj9r5o7IK40FNFN1+4ff9vIQntLCTAf71eS70gXFwq2GU0DOWzWGC5vhhjn7Jnyyi593URWfrFy0/r7jj7tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744357466; c=relaxed/simple;
	bh=eeGi5FHrussqjXJDXvSlD61fZk1xGJB5mzvOHjRnd0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q3j+ZHP9sayC+4cMNS+IdoTYjKSz9fV7DmxjVyswcY7da48k9IYu5u76Zrxopk0wesy/VVp61G8TCqdyiafCXZy9f7M0fDp3rxWPZ68yotVAsdM/+tXrhmfosHMq3iBIj4SMOcE8+FDxbQGaaGIIBNz75FejgZN3Xibpunaps7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e9bFFkBq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 520B5C4CEE7;
	Fri, 11 Apr 2025 07:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744357465;
	bh=eeGi5FHrussqjXJDXvSlD61fZk1xGJB5mzvOHjRnd0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e9bFFkBqJ6G9Djt6wkd41LeYJK6ZmoePib13Ifx+fwUBJYyNENvG/A+mJ4tUNafyl
	 XEejg10l76J+Ct12dBBEnXXnVofkQ/R1pe33YTQOs22oPBRip1dXj1Z19xlDEdd7U1
	 9dnMxGT3BQaFjZ/gh37HEWfqzIEowbfGZlpgLt2yxhEtimBk7kJJVY6bBe9/hRzZEw
	 JhTeA6W4z1H79UmgkcY5kRpDRNSpIlF7gxVIgHYy/A4GX6JJrTLlctGLeziUUXUBpB
	 x8IYK0UPGgsT3Luqaq7G3E12jWNaR/UliciLEmkJulOoSKMsJEFfqv//0H09dsaum6
	 nhjGlvu0sHl8Q==
Date: Fri, 11 Apr 2025 08:44:21 +0100
From: Lee Jones <lee@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Tobias Junghans <tobias.junghans@inhub.de>,
	Andrew Lunn <andrew+netdev@lunn.ch>, linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v2] leds: trigger: netdev: Match net in
 netdev_trig_notify()
Message-ID: <20250411074421.GV372032@google.com>
References: <20250404151042.GC372032@google.com>
 <20250407090455.677846-1-tobias.junghans@inhub.de>
 <20250410101759.GT372032@google.com>
 <45822bb5-a408-42c1-85b7-e179789d586a@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45822bb5-a408-42c1-85b7-e179789d586a@lunn.ch>

On Thu, 10 Apr 2025, Andrew Lunn wrote:

> On Thu, Apr 10, 2025 at 11:17:59AM +0100, Lee Jones wrote:
> > Andrew et al., please could you verify for sanity?
> 
> Sorry, i did not see this before.
> 
> Maybe we need a new MAINTAINER entry for
> drivers/leds/triggers/ledtrig-timer.c which points to the netdev list?

I assume you mean:

  drivers/leds/trigger/ledtrig-netdev.c

In which case, sure, I'm all for that.

Add it to your MAINTAINERS entry and I will Ack it.

> Humm:
> 
> ./scripts/get_maintainer.pl drivers/leds/trigger/ledtrig-netdev.c 
> Lee Jones <lee@kernel.org> (maintainer:LED SUBSYSTEM,commit_signer:4/4=100%)
> Pavel Machek <pavel@kernel.org> (maintainer:LED SUBSYSTEM)
> Andrew Lunn <andrew@lunn.ch> (commit_signer:2/4=50%)
> Marek Vasut <marex@denx.de> (commit_signer:2/4=50%,authored:2/4=50%,added_lines:15/36=42%,removed_lines:3/8=38%)
> Heiner Kallweit <hkallweit1@gmail.com> (commit_signer:1/4=25%,authored:1/4=25%,removed_lines:2/8=25%)
> Lukasz Majewski <lukma@denx.de> (commit_signer:1/4=25%,authored:1/4=25%,added_lines:21/36=58%,removed_lines:3/8=38%)
> linux-leds@vger.kernel.org (open list:LED SUBSYSTEM)
> linux-kernel@vger.kernel.org (open list)
> 
> So i should of been Cc:ed.

To be fair to the contributor, I don't always add commit signers either.

> Network names spaces and files in /sysfs probably need netdev
> involved, in order to get a good review.

Definitely.

-- 
Lee Jones [李琼斯]

