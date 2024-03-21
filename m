Return-Path: <linux-leds+bounces-1283-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EA688606E
	for <lists+linux-leds@lfdr.de>; Thu, 21 Mar 2024 19:18:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6E2C1C221CD
	for <lists+linux-leds@lfdr.de>; Thu, 21 Mar 2024 18:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CFAD1332BB;
	Thu, 21 Mar 2024 18:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oETWmU7u"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232EC56B76;
	Thu, 21 Mar 2024 18:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711045079; cv=none; b=lWSPkWI0pc4RvCXmMeahcdfm0SY0eQmqavlgxIXwOAKqlO4c0mPYnfvpDUi42UHrPBpxJumrawDAMfn5fbKu60urjfsoEKG2dUq4mXXOWQGHdlZGFyovzoUsk8PlZuFgHb53lh3P8Z9jH6uzxCyyojgngowNdFGfdqP8o+t07Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711045079; c=relaxed/simple;
	bh=n30lmUTaurXJL0m9vzKRKEcVW+uOPFlH8nDiOrmwatA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p7bmV33zQe/4vy3DabOIjcMoCuE08hnhlkPHIyaeoKav1VFsXgVK90hTQBTj4N+vTh9DuI288Tarrmro52U8qUk0n+8xa8VpPZtxoYGsF9uhQtH0mcEFy2UcjsJsnZs5c09nD+XFUu4JQH0MccOX1yR45WQ/Ld/W2GW7WAa7Vlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oETWmU7u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5562DC433F1;
	Thu, 21 Mar 2024 18:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711045078;
	bh=n30lmUTaurXJL0m9vzKRKEcVW+uOPFlH8nDiOrmwatA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oETWmU7uQsbX8mhu0Eq9o8tfeMByFeBEvERGAnGJ6RDJbLQIbj/WiyAivPqWaIy7n
	 vGGXT7hsqTUOqg1NqziFlYPLrcRTLOXTFSM6KnheDb6ZOyy0v2KyP4SgAA5w9yjKP2
	 vFaAEiWQ5K/n/o9gHL2raHVe+xTLKjyaZTBfZ0MHHpqOnGXmkB09JVrbJYJbx4zr5g
	 mC8hasaUVeoH4Hst2MzfW07KtX7K4lfDGevhi933bymU9cCvDFrTYipasHZM4v9g6D
	 DDpGJFy4G3GbXeF+tYz4vk/9SOz25Naajy3uoBOZSECcUbEZkubV4QAJGKz6Yo2PNA
	 wCHPb3hPyc3RQ==
Date: Thu, 21 Mar 2024 18:17:53 +0000
From: Lee Jones <lee@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Anders Darander <anders@chargestorm.se>,
	Matt Ranostay <mranostay@gmail.com>,
	Peter Meerwald <pmeerw@pmeerw.net>,
	Ricardo Ribalda <ribalda@kernel.org>
Subject: Re: (subset) [PATCH] dt-bindings: leds: pca963x: Convert text
 bindings to YAML
Message-ID: <20240321181753.GH13211@google.com>
References: <20240305004501.849-1-laurent.pinchart@ideasonboard.com>
 <171103315829.46862.417559829428388360.b4-ty@kernel.org>
 <20240321180935.GF18799@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240321180935.GF18799@pendragon.ideasonboard.com>

On Thu, 21 Mar 2024, Laurent Pinchart wrote:

> Hi Lee,
> 
> On Thu, Mar 21, 2024 at 02:59:18PM +0000, Lee Jones wrote:
> > On Tue, 05 Mar 2024 02:45:01 +0200, Laurent Pinchart wrote:
> > > Convert the pca963x DT bindings to YAML schema. The existing properties
> > > are kept without modification, but the example is adapted to the latest
> > > common bindings for LEDs.
> > 
> > Applied, thanks!
> > 
> > [1/1] dt-bindings: leds: pca963x: Convert text bindings to YAML
> >       commit: 779027a0a7392610cbfd3210836d6b0e6ddef434
> 
> Thank you. https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git/
> doesn't contain that commit, have you just not pushed yet, or am I
> looking at the wrong tree ?

I haven't pushed anything publicly today yet.  Still collecting.

When pushed in a few moments, it'll show up in `for-leds-next-next`.

-- 
Lee Jones [李琼斯]

