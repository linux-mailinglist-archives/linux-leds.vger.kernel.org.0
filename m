Return-Path: <linux-leds+bounces-7966-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id PEjqOv3192kUowIAu9opvQ
	(envelope-from <linux-leds+bounces-7966-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 04 May 2026 03:27:25 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 819D84B7F49
	for <lists+linux-leds@lfdr.de>; Mon, 04 May 2026 03:27:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6E1D93000B18
	for <lists+linux-leds@lfdr.de>; Mon,  4 May 2026 01:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 227431A76BB;
	Mon,  4 May 2026 01:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XrlJO5CX"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C225513B58C
	for <linux-leds@vger.kernel.org>; Mon,  4 May 2026 01:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777858042; cv=pass; b=lAcrJNjV2T/GJyuH815PBRgWEcqPsQ5vLTmrHJrsOjH4aJKtA5AbfI5d2aNLdp60aJLFsOWL/UycXS1P/bx1yYNV1vDVN0W9l8eUwLzr6jqVZKUblbR8TcB2VrSadq0lBKaPyjnJpqOf6tDg+y+gtgz2iuTZdCbGxXdvbuwXzJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777858042; c=relaxed/simple;
	bh=l4g5Cnxwyg4GB/mKplMPUSrP+qwGfFb0vQX7A+4hzBw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XOOGZUSkYwWD68/r+Y6sa3Yli3cKklV9tzEu1NMiJrNRXDpyl3xgQdt34HGxeiTkgnxjvIn8i74sGN4zIYyChUxEoUeRTB3oOHXwhPlefJWYrO2PiAi8MSI781b9XX400mSROB65KJLstjViwhB54b1mNzuhVcKRIeK3iBw3u/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XrlJO5CX; arc=pass smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-89fc4147f2eso47740606d6.3
        for <linux-leds@vger.kernel.org>; Sun, 03 May 2026 18:27:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777858040; cv=none;
        d=google.com; s=arc-20240605;
        b=Ny1iPnjBCLjn36lDmtBNDojaP/Pm5bUolY6aQTq6ZVPQouQbUIxKqCxcrsiCgncCjB
         H3z8In7nSdFMrgFwLra+42MjrBUaDkFDsJSAGIpdPbip1lZGAUkYNOysYKEwAG7Zfok/
         HcBbxOiEiKRAbCXz3ORLn4jL6J8JZ0wT5U+zPJK5nm5Xv9v36EUVvfLjlMK4Qr4Ed3/P
         KWBaNMe8oJZk6hZ4/5chLNdfe4DvTucwy4xgiCEudkONsABDeMJnQyjkUGzzddr2LKis
         lZ1bgi/rUkBK9FA0rBg/NrlemNkd+XMN7yiQrPuP4JmF1hmTmuQ41sPOwragBslYpiGv
         piGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=l4g5Cnxwyg4GB/mKplMPUSrP+qwGfFb0vQX7A+4hzBw=;
        fh=GJwKBragq07ZzGV6WyZjG++bg7kq/BEXvJBstA3CyLc=;
        b=JGTye9HYf3AGix8r89o5cq6DWnYwmCg4hT5jdaC5z53eT/bBa1u/M/IvBfE7CgbuO4
         Br+xOQttfBl7163kWIUK6Swu8C989JCCFjrjwvM2lTfPQfAPIzoBtnjcVIOU9c5v/1dZ
         BpLE/ltvAaBSGZiok38qHu+VYJVXzTcaJBfnnDAidIcCMRKSKqoK8sHkjlclb03i1uXq
         K1YEJntU1daEV2ZrYyATmCF2eLixqSr0mFJE/23k+Gt3vztDECUAvpp0MVOBsF1y5zi6
         lDmmn/P4MFdMcoKFN4obXcfOC5XbUx+GvL5rX5WuhoIL4JX5wrH6SBrQzB2DdwDdZKIz
         CTyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777858040; x=1778462840; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l4g5Cnxwyg4GB/mKplMPUSrP+qwGfFb0vQX7A+4hzBw=;
        b=XrlJO5CXaOkziiuRwTlDtkA2zp0FZ6YKZlOFOoce3oN82OIQcVc7aGHg6vduL+vnIS
         LxqGG1/CF5XVbTjSJDZ6dPOt/zZiRWNR4zx8RwLMg2Yn5QYwBXQw94GdPSiLQzsSn89+
         7X6ODesCH6h+yiy24XZA9hFkthVcHYSv+9o5UM4JhDooSkEwKhoSMLZbsKYf3tdaeVMC
         0aDIHNdqJvhabYOLjHzBOKNDfYYyvqSbx2DbcOfDIc/OvWVtsYdmscio+bYqQw/O8i69
         fwEyzibP21/h1BDhiW1vr62w/axi8qGB6sD+p0ZbR9DymPkk1hGHrA66rDXzgvW4ma+j
         oOSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777858040; x=1778462840;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4g5Cnxwyg4GB/mKplMPUSrP+qwGfFb0vQX7A+4hzBw=;
        b=O0y1+ByM55UPwTn8D5VQJ8oopXDCHvd4gg6/mdgDDXsd3bmYf/qB7Gsa26qW/wDOBv
         KvWGDlFvNBClNjltmLXhaAsNGi0zlR/WW3O5l46nyDgKDJRNHxeXsdz8IPj177LzJcR7
         FTv8eFnQ7Wu5F2UY9rVYIIQogOKIaZnvha8B1ltIcP3iRIPfNDvZgVidItjBgYTdNuaG
         lKIT+GLRvyfZZ/J2iKjCCbCkgi1itPm09rWSM8RnB56fNe804sdSsaTG8UfScGmX32Aa
         kPQrPsvpu6rGnUxRtdCw42J1WiMQha6eUX93htoQIZUc2U7N6pg9/xIxVav6CoPGphBH
         Fh/A==
X-Forwarded-Encrypted: i=1; AFNElJ97ucakNC0X/b6jVBHx8T0AF/rYPNQ7g/Y5N2g18QWgjJlB/RgnveiRsWkna/yJ7gJpChEzcBlj4OR2@vger.kernel.org
X-Gm-Message-State: AOJu0YzHyGUFco7kRvFolk4MOESyMoo4NnvW57NKA/WGLhh9v/OeETH9
	TMktw09iwpoyLVvsQ0c6Yd0BBRAVFCNEEAglh8Jg7jbPtH06aLOAD2Rg0WItSOlJW2UXFtaWmqE
	1akC60osHDROz4mqB3cujnaMqBLHV7EM=
X-Gm-Gg: AeBDievdwgDFCDD0qlUvPkOy3h6f5VWpUTAyV53PAAnY5BW78R8dHhs1cdxkDWfXWPy
	Q7AQX90QXma/o6s6fFB9hTg/E6cpKGqDn3nOghSAfhFeO0Slk+ZYM+8LMkqs3+uOBj4P3uQUNrr
	afa63bA02hXfDdCmTvwVaOkp31Bdr+oIyxP7S2k13sk9oEUlgf5/kshiJCEZiTZe84jhHZDcWGE
	saEXVdhu0hCWVdvFGAeshzGFBNkF2XNvuoVe3ri97nFETIuwVMslYp3l3xTsyrYjCP9N5w5Of98
	ZT2+n6j7tupRJmXe
X-Received: by 2002:a05:6214:8014:b0:89c:e5f0:8f33 with SMTP id
 6a1803df08f44-8b665c16b14mr121335896d6.10.1777858039703; Sun, 03 May 2026
 18:27:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260503072643.2774762-1-jye836@gmail.com> <20260503072643.2774762-6-jye836@gmail.com>
 <769ce05a-3148-408f-b012-74a85c1a2343@linux.dev>
In-Reply-To: <769ce05a-3148-408f-b012-74a85c1a2343@linux.dev>
From: James Ye <jye836@gmail.com>
Date: Mon, 4 May 2026 11:27:08 +1000
X-Gm-Features: AVHnY4KOOclnC_MZbxgLb-vdcjxHx60EFQt1kvDovJkmfkC6hle_r_NMWoYF9V0
Message-ID: <CAEV1_7FPDWxgSqtxCCVbgjXeOO+pBK4ki0Ac+WagVX1pRPrG6A@mail.gmail.com>
Subject: Re: [PATCH 5/6] HID: asus: add microphone mute LED support for T3304
To: Denis Benato <denis.benato@linux.dev>
Cc: jikos@kernel.org, bentiss@kernel.org, lee@kernel.org, pavel@kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 819D84B7F49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-7966-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jye836@gmail.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,linux.dev:email]

On Mon, 4 May 2026 at 08:45, Denis Benato <denis.benato@linux.dev> wrote:
> Isn't QUIRK_T3304_KEYBOARD enough? Or are you saying you know there is more than one keyboard
> model that requires this?

I don't know for certain if there are any other such keyboards with
LEDs that need to be handled like this, but I can imagine that there
are.

I decided to introduce an additional quirk because:
- I don't know how to detect if a micmute LED is present.
- The quirk could be used to implement support in other devices.
- asus_kbd_register_leds is also gated by QUIRK_USE_KBD_BACKLIGHT,
adding a device-specific quirk didn't feel appropriate.

If there turns out to be a widely-supported detection method and T330
doesn't support this, then just QUIRK_T3304_KEYBOARD would be better.

If you would prefer then I shall remove QUIRK_HID_MICMUTE. This can be
revisited when more than one device uses this code.

>
> Do we really want to use strlen?
>
> Do we really want to use strlen on the result of a function without additional checks?

My understanding is that this is safe, as this name is set by the
kernel. Existing use of dev_name appears to not involve additional
checks.

> This doesn't look like a good idea to change this for all laptops under the sun...
>
>
> Perhaps might make sense to move this check before? Maybe not?

Returning an error from asus_kbd_register_leds is currently non-fatal,
so the only difference in behaviour is that devices with
QUIRK_USE_KBD_BACKLIGHT that do not report supporting a backlight will
no longer log a warning.

T3304 indeed lacks a backlight, so we can't proceed with the backlight
setup code, but asus_kbd_get_functions() is still a prerequisite for
the micmute LED.

I think the alternative is:
- Move the asus_kbd_get_functions() call site from
asus_kbd_register_leds() to asus_probe(), and
- Separate asus_kbd_register_leds() into two functions for backlight
and micmute LEDs respectively, keeping the current behaviour for
backlight registration.

Your thoughts?

Cheers,
James

>
> Denis

