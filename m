Return-Path: <linux-leds+bounces-2520-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A7595C6CD
	for <lists+linux-leds@lfdr.de>; Fri, 23 Aug 2024 09:42:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D091FB2107C
	for <lists+linux-leds@lfdr.de>; Fri, 23 Aug 2024 07:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0C5913D51C;
	Fri, 23 Aug 2024 07:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lKSOfxt/"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BA213D2B2;
	Fri, 23 Aug 2024 07:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724398936; cv=none; b=tghzWtdlW88sMM4DqBPAmTGpvAjyU/TgG8IyIG3hp5A+t3G5kZBGPlk9ZH+p++w2wxanZs4EM7rNuO8Am4WXrC0qQSW0XWyF4HvOpxvQe8TYNvcC/YPMDWNGCEALxz6qpFXPhkq+d2VPWBCPMC8FjbWzDu1AgRbBoDpGRifxDFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724398936; c=relaxed/simple;
	bh=S+HKVrDbu0nCl1VGQWHp5XpmJZSWQdry+gMoS52FIsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R1lnwzn9ncVK8oefWFHfI1IS8wz//EWhqVTuekTljNazs+dJ3rtbHoQ0h7AzLq4g5NXV4ATSWRfykPxwVcddshuvSkC2KlV9AxbnyyARi4M3zBrSit8ab+w6cemCuHS0XrWGOrTjvsDVaag3ZwnZQht8wldrH4sZ3n2q+TUIMxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lKSOfxt/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A14A0C4AF0B;
	Fri, 23 Aug 2024 07:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724398936;
	bh=S+HKVrDbu0nCl1VGQWHp5XpmJZSWQdry+gMoS52FIsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lKSOfxt//A4mZB8WzpqzqZ+7Q6/QLjvhgUemBQwAkVL6VCoHWXM3ibt+hSxEbiKof
	 uMzKVxwn5YStd2tbqk/jbs//tpNZIlbZ/mLL74mRx9OsenI1OvYd9DAaaDFH+LDl6x
	 HiS0kdV3s2qKik5wBJarDt+RwIUFqjHY2Gclsunisd9FRbdkUjy1PJQOiqBM3NzhpM
	 nzNOLYdBYljvRzuvuFiqGa4HkFUcouAACQ+LtjPKIrLKQ87zH5+suUkRylGfSQ5cDi
	 hpwPTS6Dw/xhhK04rlSOd9zKrCRt61Bo1TYpcYHsiBBWx4I4JQn1GjzMnmdjDz+NR2
	 d/5/JND3Uh0tw==
Date: Fri, 23 Aug 2024 08:42:11 +0100
From: Lee Jones <lee@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] leds: gpio: Set num_leds after allocation
Message-ID: <20240823074211.GM6858@google.com>
References: <20240716212455.work.809-kees@kernel.org>
 <c16715ff-1e47-4a73-8fcb-87462069b5ca@embeddedor.com>
 <20240725102240.GE501857@google.com>
 <202408221713.77EF78D1@keescook>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202408221713.77EF78D1@keescook>

On Thu, 22 Aug 2024, Kees Cook wrote:

> On Thu, Jul 25, 2024 at 11:22:40AM +0100, Lee Jones wrote:
> > On Tue, 16 Jul 2024, Gustavo A. R. Silva wrote:
> > 
> > > 
> > > 
> > > On 16/07/24 15:24, Kees Cook wrote:
> > > > With the new __counted_by annotation, the "num_leds" variable needs to
> > > > valid for accesses to the "leds" array. This requirement is not met in
> > > > gpio_leds_create(), since "num_leds" starts at "0", so "leds" index "0"
> > > > will not be considered valid (num_leds would need to be "1" to access
> > > > index "0").
> > > > 
> > > > Fix this by setting the allocation size after allocation, and then update
> > > > the final count based on how many were actually added to the array.
> > > > 
> > > > Fixes: 52cd75108a42 ("leds: gpio: Annotate struct gpio_leds_priv with __counted_by")
> > > > Signed-off-by: Kees Cook <kees@kernel.org>
> > > 
> > > Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> > > 
> > > Thanks
> > > -- 
> > 
> > Using the signature tag in the middle of an email turns the remainder of
> > the body into a signature block, which is odd to say the least.  By all
> > means sign-off in the middle of a mail, but please refrain from
> > converting the rest of the mail.
> 
> Ping. Shall I take this via the hardening tree?

Certainly not. :)

Apologies, looks like I relied to Gustavo then marked the submission as
reviewed.  Applied to the LED tree now, thanks.

-- 
Lee Jones [李琼斯]

