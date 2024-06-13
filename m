Return-Path: <linux-leds+bounces-1918-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5489079E6
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 19:31:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8ABC28580E
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 17:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68063149C79;
	Thu, 13 Jun 2024 17:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q4FVEej0"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44814149C4E
	for <linux-leds@vger.kernel.org>; Thu, 13 Jun 2024 17:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718299877; cv=none; b=IONH4fH7G7kDYt6oLe3GtCS8oojFyu9T/CYZcN08P87BmrzjPa30jz33J/FHW0XOT0jK6hHXH/aUBVXE7+rkptU0X/TSnGFdxwWNZwL2ATtV4baUDzYozkApVDIkJKC4yA0iLu2sru3sjLzzg6d9yUWlf4UXt28S+DmNmc/uzXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718299877; c=relaxed/simple;
	bh=bq+NZATV5YieB8Im37vDma47tiSDSMvibQqsVrffwis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FMmbF/5+gETgjMw9pFi7mnIzNPXVvxTh5+WU1qoQFylHyIo0ARbROQYQXZHQOJ/WplTIVkNz+bGmzQ45EUE0FH5pHhcrgDkBU038gUBctd+kzTKqYCS/f8McjPHW/vAbvjo28CtpMe1gobvpWt2gr/u9h0vL3CjwfmpDwyHM9ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q4FVEej0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60249C4AF50;
	Thu, 13 Jun 2024 17:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718299876;
	bh=bq+NZATV5YieB8Im37vDma47tiSDSMvibQqsVrffwis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q4FVEej0N87X3dznJHDzGsiuG3ETcsB9OWS7rYyuMlFRL9oE4HJAJeXm0ofINtwx/
	 rbQX0x1BUCPQEQvYvr7UHG+bQULfv+RECMRot/EPX7sw+1oYa+GW6mTqHfUbBgbbfq
	 mGph4BsZAY6L6WyXbBx3+p6NMFFtyRnZuxWGNTKhDHByEw+1R6xHpMD7V4Bl/441iA
	 6RTOMGPOMal2ER8V84zxP9dI5fuxgNm9Wu98isRo8bdPpblqTbr8zvbUOG2N9y64Fp
	 fntmYXKpIdDM0bSXP7CpD+/sxOatnXdLEjLt+PKeCJ1l0Y1j3R9E+buMNNKDZch9lO
	 GVGr7iBMrICtA==
Date: Thu, 13 Jun 2024 18:31:12 +0100
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: Joseph Strauss <jstrauss@mailbox.org>, jansimon.moeller@gmx.de,
	conor@kernel.org, christophe.jaillet@wanadoo.fr,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v7] Add multicolor support to BlinkM LED driver
Message-ID: <20240613173112.GU2561462@google.com>
References: <20240506201905.789376-1-jstrauss@mailbox.org>
 <20240531103840.GC1005600@google.com>
 <20240531232031.u5mphuqrwin533rj@libretux>
 <20240613134933.GC2561462@google.com>
 <Zmr57Iyd9UHWUYy9@duo.ucw.cz>
 <20240613172240.GS2561462@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240613172240.GS2561462@google.com>

On Thu, 13 Jun 2024, Lee Jones wrote:

> On Thu, 13 Jun 2024, Pavel Machek wrote:
> 
> > Hi!
> > 
> > > Pavel's for-next branch is 18 months old.
> > > 
> > > Use Linux -next.
> > > 
> > > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/
> > 
> > LED SUBSYSTEM
> > M:      Pavel Machek <pavel@ucw.cz>
> > M:      Lee Jones <lee@kernel.org>
> > L:      linux-leds@vger.kernel.org
> > S:      Maintained
> > T:      git git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git
> > 
> > I guess we should get the MAINTAINERS entry updated.
> 
> Good point.  I'll submit a patch.

https://lore.kernel.org/all/20240613172736.2735856-1-lee@kernel.org/

-- 
Lee Jones [李琼斯]

