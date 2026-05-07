Return-Path: <linux-leds+bounces-8029-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLMnL6SR/Gn3RQAAu9opvQ
	(envelope-from <linux-leds+bounces-8029-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 07 May 2026 15:20:36 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DF24E920F
	for <lists+linux-leds@lfdr.de>; Thu, 07 May 2026 15:20:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E6A51300251B
	for <lists+linux-leds@lfdr.de>; Thu,  7 May 2026 13:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFD53388E49;
	Thu,  7 May 2026 13:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SentzYFa"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B633379EDA;
	Thu,  7 May 2026 13:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159493; cv=none; b=nBp59XxdLPWZkaj9iehOTt1wzt7lKukLA8LMBCJv2UC6f45H8Z+soORW4AWp+PhO+3R9b56LYOyDf9GAUhG8QOmr8Ri0L44/juuHHcc++u5GKTS5FmxFoVu/TkhzT2JlT6vhbaiUCZpjKj5lPZj6HGOL9htQKls5KrQ4wGxHr44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159493; c=relaxed/simple;
	bh=0lvSkOgs/jQfd4C4sVbilUEt7hWbVexFDzg0KGzQNb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DRI8R+Ak/V1QvC7YoUTZN/Q2qchvr/hsmzDW24Hh/Y0LNvhpRLjc23TfGeUcD1yvtioF5lw0NVQXvNHSrM2y15bN0jgaOdN3NziL3DqEdS0y6QJGOjBO2MnGdHWtQzPxEORXWsVzphMEhKAjw2sRoUFUMNInALDi+MFMRKYRZ6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SentzYFa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72EB4C2BCB2;
	Thu,  7 May 2026 13:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778159493;
	bh=0lvSkOgs/jQfd4C4sVbilUEt7hWbVexFDzg0KGzQNb0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SentzYFa0QVytjPwJUqlWuAKqWcW0Z4L9XpzPOiLedLLgWpeMy2XKpXOWcGkqT6z/
	 Q170Un/fSSklxXWUfJO9zCrn2Cv+ZHyECdtONH+pJtKWy3c9wT77J3zeZm+UY1x0xH
	 NOv7wKuiAIiITBxixL5Om4R3Rusbmi/5iXmVQKqsqdhRmF1b+l0XT63KcB5qtpkaGv
	 cyK5SETNC9ZksOizb23OymQaICfX+yd53osbZbrLsgMRLZzhS0oa0vlIDj5VtCox32
	 Do+3Gsn+ZTENQQBp7dly9M6UJoYFeCj8R1ZbLCmt9rbuG0MLemR64h4JW6NTCUKSo0
	 BHwyjme4ebCtw==
Date: Thu, 7 May 2026 14:11:28 +0100
From: Lee Jones <lee@kernel.org>
To: =?iso-8859-1?Q?Bj=F6rn?= Persson <Bjorn@xn--rombobjrn-67a.se>
Cc: Pavel Machek <pavel@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: leds: uleds: Make the documentation match the code.
Message-ID: <20260507131128.GM305027@google.com>
References: <20260402220811.4804DD8F722@tag.xn--rombobjrn-67a.se>
 <20260423152655.GF170138@google.com>
 <20260424194714.71de0ef6@tag.xn--rombobjrn-67a.se>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260424194714.71de0ef6@tag.xn--rombobjrn-67a.se>
X-Rspamd-Queue-Id: C4DF24E920F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8029-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,rombobj=?UTF-8?Q?=C3=B6?=rn.se:email]
X-Rspamd-Action: no action

On Fri, 24 Apr 2026, Björn Persson wrote:

> Lee Jones wrote:
> > On Thu, 02 Apr 2026, Björn Persson wrote:
> > 
> > > From: Björn Persson <Bjorn@Rombobjörn.se>
> > > 
> > > · max_brightness must be set. Leaving it uninitialized or just omitting it
> > >   won't work.  
> > 
> > What are these points?  How do you even type one of those?
> 
> The bullet point is the character U+00B7 middle dot. I type it with
> AltGr-period on a Swedish keyboard in Fedora. I don't know what keymap
> your distro uses for your keyboard. I hear some keyboards lack an AltGr
> key.

Please use ASCII or you'll freak out the Luddites (like me)!

- or * is fine.

> > Anyway, proper sentences / paragraphs is better.
> 
> You mean you dislike bulleted lists?
> 
> Or if you mean that the first sentence doesn't begin with a capital M,
> that's because identifiers are case-sensitive in C. There is no
> Max_brightness, and if it were defined, it would be different from
> max_brightness.
> 
> Otherwise I don't understand what you mean with "proper sentences", as
> I don't see any grammatical errors.

By all means use bullet points for lists, but a slab list of changes in
place of sentences is a little odd.  Simply describe your changes as you
would speak to another human.

> > > -A new LED class device will be created with the name given. The name can be
> > > -any valid sysfs device node name, but consider using the LED class naming
> > > -convention of "devicename:color:function".
> > > +A new LED class device will be created with the given name and maximum  
> > 
> > Did you mean to revers "name given"?  A "given name" usually means
> > something else.
> 
> I felt that "the name and maximum brightness given" would be
> grammatically awkward.
> 
> To prevent misinterpretation, how about replacing "given" with a
> synonym? Perhaps "the specified name and maximum brightness"? Another

This is nice.

> option is "the given maximum brightness and name", but it feels a
> little odd to mention the brightness before the name.
> 
> > > +Although max_brightness is a signed int, only positive values are valid:
> > > +1 to INT_MAX.  
> > 
> > What about 0?
> 
> That will get you an EINVAL from uleds.c – presumably because a
> brightness interval from 0 to 0 would be pointless. That LED would never
> be lit.

Ah, this is MAX brightness.

Okay so it's impossible to set a LED to always off.

> > > +The current brightness is found by reading a whole int from the character  
> > 
> > Try not to shorten names in documentation "integer".
> 
> The type is named "int" in C. There are many integer types, but it would
> be wrong to try to read a uint16_t or a size_t or any other integer
> type. The document needs to use the actual type name to make it clear to
> the reader that they must read sizeof(int) bytes.

Right, but you're not writing in C.

> > Why do we need to specify "whole"?
> 
> Because you can't read it piecemeal. Usually when you read from a disk
> file, a pipe, a TCP socket or some other bytestream, the system call
> will let you read one byte at a time if you want. A reader might assume
> that /dev/uleds works the same way.
> 
> From a datagram socket you can read the beginning of a datagram and
> discard the part that doesn't fit in your buffer. To a reader with a
> little-endian system and max_brightness ≤ 255, it might seem logical
> that they'd be able to read the first byte and discard the bits that
> will always be zero.
> 
> I thought "whole" would communicate to the reader that they must read
> sizeof(int) bytes in a single system call.
> 
> It seems this wording wasn't enough to get the point across that it's
> necessary to read an int, a whole int, and nothing but an int. Do you
> think the document needs to expound that point more?

I think it needs rephrasing a little.

  "Current brightness is obtained from the character device.  It is
  read in as an integer and must be done so in one go.

Or words to that effect.

-- 
Lee Jones

