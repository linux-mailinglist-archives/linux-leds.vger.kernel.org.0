Return-Path: <linux-leds+bounces-3087-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C051099DAB4
	for <lists+linux-leds@lfdr.de>; Tue, 15 Oct 2024 02:37:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C0F51F222CD
	for <lists+linux-leds@lfdr.de>; Tue, 15 Oct 2024 00:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDD37AD55;
	Tue, 15 Oct 2024 00:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cufWovvF"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E051B7F4;
	Tue, 15 Oct 2024 00:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728952637; cv=none; b=iLsh4HY/mEFQTfiwvT+14rBW6I8Q+DIbrqiUF7BGZNL08Z1Wesne0433Q143zVEiqinyfeoO4n3JYR1CvGbYatHC3ni43gy6R6SDGAAbwI557C3Uw4T768H/SrfuGT0MgfVDkAqyy6vEflIi7Wx7o8+G5VdEjNBWCdfGMMuMGdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728952637; c=relaxed/simple;
	bh=ghXbgNkKFxzOJvB3Lri2nXRIzvvHq7IauZH0nYGZG9A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iXjB5Dh64n8MnSiXrq6VgaFA/h9F7fDtZXTAHuc6iZDJQvKQhy1LdKxEo3keYq8Y0g+ILtBoXtJnvj9cga3pzuCiXxnZNLReREejQ8IxAgh43tEVdFaJz4EOp+jU+bkMaIlEK4Tp+uws9BsLPWGqPfXAS+leHSZGMwlShlck0fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cufWovvF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79FA2C4CEC3;
	Tue, 15 Oct 2024 00:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728952637;
	bh=ghXbgNkKFxzOJvB3Lri2nXRIzvvHq7IauZH0nYGZG9A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cufWovvFgwK2IVGZJsetcYLZPuzGzH1ItVbbP83pc5RKItZtg6KCAICtXUDvGqLv7
	 XXQGapYhsuYgflwzZ2AM2tRJKTVKZXBbomwxttBCJg7gYd09x+mQWCpxpb6X8ve0e3
	 +QkA4vbFmwBdzlIA3YQusWuQjtq1LdEaxUbtFbOjw8f/dvTFuWNbQIx3xNJOFQHn8w
	 hXdoYj0nUG5T4d3B5C2VdOgZZ4X8AUwBdeBukTzkB9DJ/FlAS/Hikwo+WF7tM5aj9j
	 qtqa0lN2x4V1jIucxo8kCWuM1zp39ewayG6GEwvjb5mY1OZcQCZuKIgcAJMl5q9A+W
	 MPVWiiYIACb/Q==
Date: Mon, 14 Oct 2024 17:37:15 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Xu Liang <lxu@maxlinear.com>, Christian Marangi
 <ansuelsmth@gmail.com>, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>, Robert Marko <robimarko@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Jacek Anaszewski
 <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/5] dt-bindings: leds: add 'active-high'
 property
Message-ID: <20241014173715.08a2313d@kernel.org>
In-Reply-To: <e9b15613a81129ceecb07ec51f71bbe75425ad2e.1728558223.git.daniel@makrotopia.org>
References: <e9b15613a81129ceecb07ec51f71bbe75425ad2e.1728558223.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Oct 2024 13:53:36 +0100 Daniel Golle wrote:
> Other than described in commit c94d1783136e ("dt-bindings: net: phy:
> Make LED active-low property common") the absence of the 'active-low'
> property means not to touch the polarity settings which are inherited
> from reset defaults, the bootloader or bootstrap configuration. Hence,
> in order to override a LED pin being active-high in case of the default,
> bootloader or bootstrap setting being active-low an additional property
> 'active-high' is required. Document that property and make it mutually
> exclusive to the existing 'active-low' property.

Daniel, please make sure you provide a cover letter for any submissions
longer than 2 patches. If nothing else it gives the maintainers a quick
overview of which files you're touching.

This submission is okay but please correct going forward.

Let's wait a bit longer for Lee to ack / take the first patch and then
I presume we take the rest.

