Return-Path: <linux-leds+bounces-4372-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 000E4A74541
	for <lists+linux-leds@lfdr.de>; Fri, 28 Mar 2025 09:20:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B45013B00BA
	for <lists+linux-leds@lfdr.de>; Fri, 28 Mar 2025 08:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 448781AE01C;
	Fri, 28 Mar 2025 08:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P+wQip0F"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15ACB18871F;
	Fri, 28 Mar 2025 08:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743150035; cv=none; b=h1knmDyYSiFs6MYkYPy18zWath3Tm4/3Pyww1W4aASmj3xjV5WhaYb4MRObI2rkowWYpfBpFSyJVZEAfenyhcrthlvtOxQDuYYdTv61wG9rjuyDBzT9nbyKDQeYFuR3gGyOkoqpsiu8My8TjleAQmlxq2manUB5aeP2l9x9yqno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743150035; c=relaxed/simple;
	bh=f8M7mTbtvhkQW6bkNjKahwsuKAxAI9kl7KWwcre5Gpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ABDZj9dJrpYQLYBcjDvsk4NYDzRvoyIX6pc7hM+7Go8NPff6j4BAr6pBN3LEiMCHifi+H5pfHd4L/ChrjrIIESvADzlPxK9J+1nFtoxUwQMCPdacvDSX/9jvu1QjaXReeVh0FRGQUjS2h//FGJjh61aJTgxNO+NaslIiNh0BpZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P+wQip0F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5928FC4CEE4;
	Fri, 28 Mar 2025 08:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743150034;
	bh=f8M7mTbtvhkQW6bkNjKahwsuKAxAI9kl7KWwcre5Gpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P+wQip0F5maaYYGLwTdNCTFUtix4kgzNHs7WoSoC3p5sKHStZtzivdrkWEImT8SR1
	 gL1lz7DxU0u5Nk+PEg77zb0uCSoovuGWtIAjn7f+ODfSKjzEOOoJ0wzHXPb2/C4zGw
	 uCjqgE+icnBLSg+CNCnAKE7axv1yfOsXtzs4V2m1vj5z4LeUuGHyJAficfOLiS6ndR
	 SfZ2oTDXP2eBakXxX/Xi46ScYahC3X0paWLzySpkzGgSXwNNccFhGwDzoaH18lui09
	 b5En5lLy6VSHFJjeM6keGtC4XmPCHBrBsytf4sqwXEhzXFGjdiJiQpoaYzKcMx3qvp
	 tR6r7BX7K2r6w==
Date: Fri, 28 Mar 2025 08:20:30 +0000
From: Lee Jones <lee@kernel.org>
To: Manuel Fombuena <fombuena@outlook.com>
Cc: pavel@ucw.cz, corbet@lwn.net, vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] Documentation: leds: remove .rst extension for
 leds-st1202 on index
Message-ID: <20250328082030.GB585744@google.com>
References: <CWLP123MB5473552E76AE71CDE3085DA9C5C32@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
 <CWLP123MB5473137572529F99746F4AC4C5C32@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
 <CWLP123MB54738759F49D377A9F080AA0C5A62@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CWLP123MB54738759F49D377A9F080AA0C5A62@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>

On Wed, 26 Mar 2025, Manuel Fombuena wrote:

> On Tue, 25 Feb 2025, Manuel Fombuena wrote:
> 
> > No other LED driver is listed on index.rst with the extension .rst.
> > Remove it.
> > 
> > Fixes: b1816b22381b ("Documentation:leds: Add leds-st1202.rst")
> > Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
> > ---
> >  Documentation/leds/index.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/leds/index.rst b/Documentation/leds/index.rst
> > index 0ab0a2128a11..76fae171039c 100644
> > --- a/Documentation/leds/index.rst
> > +++ b/Documentation/leds/index.rst
> > @@ -28,5 +28,5 @@ LEDs
> >     leds-mlxcpld
> >     leds-mt6370-rgb
> >     leds-sc27xx
> > -   leds-st1202.rst
> > +   leds-st1202
> >     leds-qcom-lpg
> > -- 
> > 2.48.1
> > 
> > 
> 
> Now that 6.14 is out, should I re-send this for 'for-leds-next' or there 
> is no need?

If this is still relevant and still applies cleanly, I'll take it from here.

-- 
Lee Jones [李琼斯]

