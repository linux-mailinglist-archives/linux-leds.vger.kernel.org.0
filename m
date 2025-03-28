Return-Path: <linux-leds+bounces-4373-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AFDA7459D
	for <lists+linux-leds@lfdr.de>; Fri, 28 Mar 2025 09:42:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A3AE3AA330
	for <lists+linux-leds@lfdr.de>; Fri, 28 Mar 2025 08:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D02F7212FAA;
	Fri, 28 Mar 2025 08:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oCGo3RDt"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A752D212B39;
	Fri, 28 Mar 2025 08:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743151365; cv=none; b=hNhPrcEV5aW3Bo6Z1Y5S/vTgXaNbmUbLAfHFgpBpNVYuyg57UHIR2StqrTR9Y/qau/ygBT3k+kIHjmWa82AnYs712D8xYho3SqPuXODPqXzBthAJEkTrNKMZ493+jDXKtXcxW2KxOpfKtnJ8/N94pS8WjAwSjOSfHZJ4IvFdNNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743151365; c=relaxed/simple;
	bh=eKiysfOtXP1WtvpY1AV0YfA4J7E/PtTyWO4U4gpCiT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LDIAfG3ifhVWflBreYHr04QAtthQJj62SWSUA7b1legmzZbTCQl0puKEmMtPuyCvtiM4KdtEMQ+mMQ3F7UOod7TbHy0N7yJ3ET7QWkh3jlSNSJ24keadecWq1fFgXZilhOutQsWdi+4RPKCBf5Syro1YLVycLKE/GniaoGGtlzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oCGo3RDt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 819DBC4CEE4;
	Fri, 28 Mar 2025 08:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743151365;
	bh=eKiysfOtXP1WtvpY1AV0YfA4J7E/PtTyWO4U4gpCiT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oCGo3RDtIzVH0sJT2bwZHE5CvaoGNME4l1ssBly4wNuIPPtDzjGuRKA3tBSu8L5qG
	 vB5lQ9Tfh11RGt31s5jYzl310aI+LSHajyBPozzAdXi8HeifobRt8RYV5T7NvJ7OEb
	 Ff8+l4ODqmMffdxeryXMuVMu+t6g85cE81scqBR/UeQpjOsKtlUJIl7lpER7oY3bqm
	 1fZFb7WbEuhH2uekwJeX6Yvd7zuEukrQbMzUk5fzyZelipzpGH9LBs5swJS2qU9ZnY
	 b+uXu1XJLCnVPShrvUImpVkkkhU2E5sgsNeejmBLBppQ3M4GFO8F0W70pqn+Lwoysg
	 lIIInw8veY/AA==
Date: Fri, 28 Mar 2025 08:42:40 +0000
From: Lee Jones <lee@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Thompson <danielt@kernel.org>, pavel@ucw.cz,
	jingoohan1@gmail.com, deller@gmx.de, simona@ffwll.ch,
	linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v4 08/11] backlight: lcd: Replace fb events with a
 dedicated function call
Message-ID: <20250328084240.GD585744@google.com>
References: <20250321095517.313713-1-tzimmermann@suse.de>
 <20250321095517.313713-9-tzimmermann@suse.de>
 <Z91NHP65X9GFIYOe@aspen.lan>
 <fd216fbf-ff4b-4d33-a8be-b1b7fe525a35@suse.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd216fbf-ff4b-4d33-a8be-b1b7fe525a35@suse.de>

On Mon, 24 Mar 2025, Thomas Zimmermann wrote:

> Hi
> 
> Am 21.03.25 um 12:27 schrieb Daniel Thompson:
> > On Fri, Mar 21, 2025 at 10:54:01AM +0100, Thomas Zimmermann wrote:
> > > Remove support for fb events from the lcd subsystem. Provide the
> > > helper lcd_notify_blank_all() instead. In fbdev, call
> > > lcd_notify_blank_all() to inform the lcd subsystem of changes
> > > to a display's blank state.
> > > 
> > > Fbdev maintains a list of all installed notifiers. Instead of fbdev
> > > notifiers, maintain an internal list of lcd devices.
> > > 
> > > v3:
> > > - export lcd_notify_mode_change_all() (kernel test robot)
> > > v2:
> > > - maintain global list of lcd devices
> > > - avoid IS_REACHABLE() in source file
> > > - use lock guards
> > > - initialize lcd list and list mutex
> > > 
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > Acked-by: Simona Vetter <simona.vetter@ffwll.ch>
> > Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
> 
> Thanks for reviewing.  There are reviews of all patches. If nothing else
> comes in, feel free to merge it via the backlight tree.  I can also take the
> series into dri-devel.

I plan to take this in via the Backlight tree.  Once applied, I'll send
out a pull-request for other maintainers to pull from.

For the record, just so we're clear, this will not make v6.15.

-- 
Lee Jones [李琼斯]

