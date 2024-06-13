Return-Path: <linux-leds+bounces-1898-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BF390757C
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 16:42:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CAE51F23910
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 14:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA71F145FE5;
	Thu, 13 Jun 2024 14:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N6yADqQa"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0B4145A02;
	Thu, 13 Jun 2024 14:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718289702; cv=none; b=JMkEjKKonIvjP7WCtVFN5FviDxCCIH9WT/1LFr2MGnP8ZgRUZ73HNNCM1+6Pgk6pvHAy5foKqxJo8FDeu9OHtaFnRdWRlNoybeY1Ry/XwXJton4RGF1hzzODuDz9qDys7hacZnaKl4/NIp8Ah0OF7GZejyxQtuLa+M22gDAS7DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718289702; c=relaxed/simple;
	bh=Y1nxcwMSb+zTs1BaeXHDgxqyBzVPA1iJTb7yBxsR4gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e01pVjp+R/v17Z5wYlI+snFcB24l4qJclPelHH3t477KdUzVHexY4Zq6pQrW5KsblxDwZfh0ruKQExnAh1O9NkledCD6R4JI3jH7w0NoCQFJ66e9mZt+u8f/btbsD9WF5HqEHcjE6Ts72m9vJ6vU6zB+t8BJs4kUPByucnN2cj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N6yADqQa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D208C2BBFC;
	Thu, 13 Jun 2024 14:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718289702;
	bh=Y1nxcwMSb+zTs1BaeXHDgxqyBzVPA1iJTb7yBxsR4gw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N6yADqQa/bBRMUtbfHabAB0TtXRZRfVHI5RqyYkEDB3OzODghkwDfLsUXFXpkKnIJ
	 GLu55tuDvw1qbkzaMxcpMBOnb5zr9Tq7YCYB1csGtyGQyNLJJG+bvK6X7Shqva2Tdo
	 t4hfYXDWb2Z+IKIDC+tTSMsBV/ZVCeE04afmCxtBa39bOts6sOjG/5CPnsiVQSL1S1
	 xJxIMEtf9sXkRvFkKmMiN2yfqD1ipHVQ+6Jd9BlZ/6dpUZDGvZZ/84INmS7fpMCU9L
	 A7qkgE6N5OqeS8vzaiSJX3MDGJfpjLfkFOMgsNYVF54BJdfEY5UAxleSV7ROfqIJf8
	 g+7kI28dnb0EA==
Date: Thu, 13 Jun 2024 15:41:37 +0100
From: Lee Jones <lee@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Dustin Howett <dustin@howett.net>, Pavel Machek <pavel@ucw.cz>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v2 0/5] ChromeOS Embedded Controller LED driver
Message-ID: <20240613144137.GG2561462@google.com>
References: <20240531-cros_ec-led-v2-0-6cc34408b40d@weissschuh.net>
 <CA+BfgNJf1Av7fRVUjpU3r6aRw6DWTHfkCuOYXP2ykhPzGTVzfw@mail.gmail.com>
 <264dd508-93c5-48d6-ac69-27458acd29c5@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <264dd508-93c5-48d6-ac69-27458acd29c5@t-8ch.de>

On Mon, 03 Jun 2024, Thomas Weißschuh wrote:

> On 2024-06-02 18:30:06+0000, Dustin Howett wrote:
> > On Fri, May 31, 2024 at 11:33 AM Thomas Weißschuh <linux@weissschuh.net> wrote:
> > >
> > > Add a LED driver that supports the LED devices exposed by the
> > > ChromeOS Embedded Controller.
> > 
> > I've tested this out on the Framework Laptop 13, 11th gen intel core
> > and AMD Ryzen 7040 editions.
> > 
> > It works fairly well! I found a couple minor issues in day-to-day use:
> 
> Thanks!
> 
> > - Restoring the trigger to chromeos-auto does not always put the EC
> > back in control, e.g. the side lights no longer return to reporting
> > charge status.
> >   I believe this happens when you move from any trigger except "none"
> > to chromeos-auto, without first setting "none".
> 
> Thanks for the report, I'll investigate that.

So am I reviewing this set or waiting for the next version?

-- 
Lee Jones [李琼斯]

