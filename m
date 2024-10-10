Return-Path: <linux-leds+bounces-3032-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D77609980BA
	for <lists+linux-leds@lfdr.de>; Thu, 10 Oct 2024 10:50:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8983B1F25031
	for <lists+linux-leds@lfdr.de>; Thu, 10 Oct 2024 08:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B5531BC077;
	Thu, 10 Oct 2024 08:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jw/yCVYw"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9FD1BBBFD;
	Thu, 10 Oct 2024 08:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728549462; cv=none; b=lpzxN7AFk6D+L7O7LKZFZDdgZwi+LYr8j2PFi55WtyImCTjRJ9IH/Mb7ZkNIbO0DMKuk0zjpixhx+pHH7WpK1vg31TQqvzTYQTdfyzrFYcf7lg9PO8gN7GTUoziP9xBd4P4TvnMTrsDBolI0HImXf/40H8dE2Zgr/VyqIlbkeDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728549462; c=relaxed/simple;
	bh=P9e+2eRrhC0tKM9yFIwl/JWMAL2GOg+8NNW+Im1Ihw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YHdgxyqchJwpkl7wn4QRY0/uavMsPMqxrcX9Y96vBucoBwlOq0epmk7sPcTUbBQGGUyMdXUpp8VLUuf2r3Pa78TFtJi8pscuN9YDRvVelrn8MbtE0GEqFZg2D/X38qWtm+Ry5e1q82vHlt2Ib1t5J6HqJQAlQH6ZVTx9N8y5Ins=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jw/yCVYw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB5B8C4CEC5;
	Thu, 10 Oct 2024 08:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728549462;
	bh=P9e+2eRrhC0tKM9yFIwl/JWMAL2GOg+8NNW+Im1Ihw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jw/yCVYwJSHyqJgOyPbM7qBX5O8oMccJR5NT1mP0GyLNSOV3KSydd8mlwY05L7LD3
	 /26Mr7KX2cnNbXJmY8jYlfXWVHllCQZVE1K4zF8Mx3BCUHBRMrEb8qFHb090o2SJMo
	 lHTmEJcDf/KnOHy1zDG/shQB4akAMJYVJoJEwjheucDD0ZQdAXv1var7Py44L7Irbr
	 kYacS0TrP06Lyky4WpmmEzv4LUcBeDm+NeiGIlV542CiN8obKaQ2aOonNxXaW79guh
	 QZ2B2WONXUlAVT/ZtYmfWKOeWeWwuELpdf5efkWndeQOXKzsrlmjtWyTsQyQ3mMx4f
	 XNZiZUIl5VXCg==
Date: Thu, 10 Oct 2024 09:37:38 +0100
From: Lee Jones <lee@kernel.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: leds: Document "rc-feedback" trigger
Message-ID: <20241010083738.GE661995@google.com>
References: <20241007205315.2477060-1-heiko@sntech.de>
 <20241009144836.GA596552@google.com>
 <23688435.6Emhk5qWAg@diego>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23688435.6Emhk5qWAg@diego>

On Wed, 09 Oct 2024, Heiko Stübner wrote:

> Hi Lee,
> 
> Am Mittwoch, 9. Oktober 2024, 16:48:36 CEST schrieb Lee Jones:
> > On Mon, 07 Oct 2024, Heiko Stuebner wrote:
> > 
> > > Document the "rc-feedback" trigger which is used to control LEDs by
> > > remote control device activity. This is an existing trigger used in
> > > existing DTs, document it so validation of those DTs would pass.
> > > 
> > > It was originally introduced into the Linux kernel in 2013 with
> > > commit 153a60bb0fac ("[media] rc: add feedback led trigger for rc keypresses")
> > > 
> > > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > > ---
> > > changes in v2:
> > > - put the entry in the correct position and comment above it (Pavel)
> > > 
> > >  Documentation/devicetree/bindings/leds/common.yaml | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
> > > index bf9a101e4d42..9cd89f30fa7c 100644
> > > --- a/Documentation/devicetree/bindings/leds/common.yaml
> > > +++ b/Documentation/devicetree/bindings/leds/common.yaml
> > > @@ -118,6 +118,8 @@ properties:
> > >              # No trigger assigned to the LED. This is the default mode
> > >              # if trigger is absent
> > >            - none
> > > +            # LED indicates remote control feedback
> > > +          - rc-feedback
> > 
> > Is 'rc' a recognised and well known abbreviation for remote control?
> > 
> > How about we people some (look-up) time and say:
> > 
> >   - remote-control-feedback
> 
> The issue being that this exact trigger rc-feedback is in the kernel for
> 11 years already - see the commit link in the description, and used in
> a number of boards in the wild since then.
> 
> So the naming-ship has sailed for a while now, and this change
> "simply" documents the status quo. And judging from Rob's Ack
> it looks like he's okay with the naming too.

This is why it's important for people to document things when they're
introduced. :(

-- 
Lee Jones [李琼斯]

