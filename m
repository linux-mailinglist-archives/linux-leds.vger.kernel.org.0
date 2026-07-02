Return-Path: <linux-leds+bounces-8846-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N0rxEgWIRmrdXwsAu9opvQ
	(envelope-from <linux-leds+bounces-8846-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 17:47:17 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7C66F99DF
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 17:47:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=bwmFWMRx;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8846-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8846-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21F41300CBF0
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 15:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CB5A381E8B;
	Thu,  2 Jul 2026 15:45:03 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE03123EAAD;
	Thu,  2 Jul 2026 15:44:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783007102; cv=none; b=IIeuRdmMw3SDyAXbp2Mz7/FIeZJXdkk03uZMPAqT0jECs1CZZBizOQA/315+2j+1Ug9EnyS+oDNnix+q8n48K+VcY6CkGqct2jVJxIXPj3dsnXPCUvYwgADMvw0HFns+4c+0OQQxeaj6eDpr6gmYXNs/9xYNu8Vefv7oqppIukQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783007102; c=relaxed/simple;
	bh=eTfY8k4xGyCGMnMhmTSmsQt7Cl763Xi3GeVLUWLh0u4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MxoLdKRs2C4XkG9AQ5K/VEv+S+luBiy5TM2fyiJQB4VALgmSMyztqebBFe5xIHocJ77ib6EA91ledD35CxcDJizhuTTGvqbR29JeyfW1l/OHFfHE7u8tAK4+ii+lWOavKrivNkK5flCzO8LO+RqMVgVGXLzXbSEAx1c3njJtIZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bwmFWMRx; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 742DC1F00A3A;
	Thu,  2 Jul 2026 15:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783007098;
	bh=fO/vTLMNlcA3KEWIRo0suAACLUwE0Sf3YPtBgQNBElM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bwmFWMRxuGCUA1TPIAovZ3a074gL+NgEMrxMoxgEid+bx8eXDOHwvor2JlW7eo1vE
	 41igzBgMu+2RYbGG1AZMlkWNbo13hAXqvSUoO7dSnxRsogHMvf/HaT+knDn0riJNrh
	 Ucv25Q17/9WAli3OlIm2ds5nPE9DJ1KUYnWSwdk5mUHEJGEzStLgZtqr5M/oYNRvJw
	 tiOeo9Ozn7yJ4jMmEaU5OAVGw1qt2G3tG1Q8Rm/p+0vv7ccg5yE5sWlcyTT7S4Qm3B
	 Ki35ddx1txySRptxtSV66WvqRo+i/4JSgn2tTTXjSfS1UAg+oyLRPEjrlXk+f2i/sh
	 Upe4J8CclL7Wg==
Date: Thu, 2 Jul 2026 16:44:53 +0100
From: Lee Jones <lee@kernel.org>
To: =?iso-8859-1?Q?Bj=F6rn?= Persson <Bjorn@xn--rombobjrn-67a.se>
Cc: Pavel Machek <pavel@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: leds: uleds: Make the documentation match the
 code.
Message-ID: <20260702154453.GT2108533@google.com>
References: <20260622125516.25EC8F47BE9@tag.xn--rombobjrn-67a.se>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260622125516.25EC8F47BE9@tag.xn--rombobjrn-67a.se>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8846-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:Bjorn@xn--rombobjrn-67a.se,m:pavel@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-leds@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-leds];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,rombobj=?UTF-8?Q?=C3=B6rn?=.se:email,msgid.link:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BA7C66F99DF

On Mon, 22 Jun 2026, Björn Persson wrote:

> From: Björn Persson <Bjorn@Rombobjörn.se>
> 
> The description in uleds.rst omits the field max_brightness and claims
> falsely that the maximum brightness is always 255. Leaving max_brightness
> uninitialized or omitting it when writing to /dev/uleds won't work. It
> must be given a value, and that value becomes the maximum brightness.
> 
> The document is also wrong about the type of brightness values. It says
> that a single byte shall be read at a time. That's actually not allowed.
> Then the word "unsigned" gives the impression that the type is unsigned.
> In fact a signed type is used even though the values are never negative.
> 
> Change the document to describe the true API.
> 
> Signed-off-by: Björn Persson <Bjorn@Rombobjörn.se>
> ---
> Changes in v2:
> Replaced "given" with "specified" to prevent misinterpretation of "given name", avoided mentioning a type name outside of C code fragments, and rewrote the commit message to read more like speech, as requested.
> 
>  Documentation/leds/uleds.rst | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/leds/uleds.rst b/Documentation/leds/uleds.rst
> index 83221098009c..f985048c641f 100644
> --- a/Documentation/leds/uleds.rst
> +++ b/Documentation/leds/uleds.rst
> @@ -17,16 +17,23 @@ structure to it (found in kernel public header file linux/uleds.h)::
>  
>      struct uleds_user_dev {
>  	char name[LED_MAX_NAME_SIZE];
> +	int max_brightness;
>      };
>  
> -A new LED class device will be created with the name given. The name can be
> -any valid sysfs device node name, but consider using the LED class naming
> -convention of "devicename:color:function".
> +A new LED class device will be created with the specified name and maximum
> +brightness. The name can be any valid sysfs device node name, but consider
> +using the LED class naming convention of "devicename:color:function".
>  
> -The current brightness is found by reading a single byte from the character
> -device. Values are unsigned: 0 to 255. Reading will block until the brightness
> -changes. The device node can also be polled to notify when the brightness value
> -changes.
> +Although max_brightness is signed, only positive values are valid: 1 to INT_MAX.
> +
> +The current brightness shall be read from the character device like so::
> +
> +    int brightness;
> +    result = read(file, &brightness, sizeof(brightness));
> +
> +The possible values are 0 to max_brightness. Reading will block until the
> +brightness changes. The device node can also be polled to notify when the
> +brightness value changes.
>  
>  The LED class device will be removed when the open file handle to /dev/uleds
>  is closed.

b4 isn't loving this patch:

Fetching patch(es)
Looking up https://lore.kernel.org/all/20260622125516.25EC8F47BE9@tag.xn--rombobjrn-67a.se/
Analyzing 1 messages in the thread
Analyzing 0 code-review messages
Checking attestation on all messages, may take a moment...
---
  ✓ [PATCH v2] docs: leds: uleds: Make the documentation match the code.
    + Link: https://patch.msgid.link/20260622125516.25EC8F47BE9@tag.xn--rombobjrn-67a.se
    + Signed-off-by: Lee Jones <lee@kernel.org>
Traceback (most recent call last):
  File "/home/joneslee/projects/b4/src/b4/command.py", line 535, in <module>
    cmd()
    ~~~^^
  File "/home/joneslee/projects/b4/src/b4/command.py", line 518, in cmd
    cmdargs.func(cmdargs)
    ~~~~~~~~~~~~^^^^^^^^^
  File "/home/joneslee/projects/b4/src/b4/command.py", line 103, in cmd_am
    b4.mbox.main(cmdargs)
    ~~~~~~~~~~~~^^^^^^^^^
  File "/home/joneslee/projects/b4/src/b4/mbox.py", line 1246, in main
    make_am(msgs, cmdargs, msgid)
    ~~~~~~~^^^^^^^^^^^^^^^^^^^^^^
  File "/home/joneslee/projects/b4/src/b4/mbox.py", line 238, in make_am
    am_msgs = lser.get_am_ready(noaddtrailers=cmdargs.noaddtrailers, addmysob=cmdargs.addmysob, addlink=cmdargs.addlink,
                                cherrypick=cherrypick, copyccs=cmdargs.copyccs, allowbadchars=cmdargs.allowbadchars,
                                showchecks=cmdargs.check)
  File "/home/joneslee/projects/b4/src/b4/__init__.py", line 972, in get_am_ready
    msg = lmsg.get_am_message(add_trailers=add_trailers, extras=extras, copyccs=copyccs,
                              addmysob=addmysob, allowbadchars=allowbadchars)
  File "/home/joneslee/projects/b4/src/b4/__init__.py", line 2888, in get_am_message
    hfrom = format_addrs([(str(i.get('Author', '')), str(i.get('Email')))])
  File "/home/joneslee/projects/b4/src/b4/__init__.py", line 4233, in format_addrs
    addrs.append(email.utils.formataddr(pair))
                 ~~~~~~~~~~~~~~~~~~~~~~^^^^^^
  File "/usr/lib/python3.13/email/utils.py", line 87, in formataddr
    address.encode('ascii')
    ~~~~~~~~~~~~~~^^^^^^^^^
UnicodeEncodeError: 'ascii' codec can't encode character '\xf6' in position 13: ordinal not in range(128)

-- 
Lee Jones

