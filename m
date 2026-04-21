Return-Path: <linux-leds+bounces-7787-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAxtCx2T52lE+AEAu9opvQ
	(envelope-from <linux-leds+bounces-7787-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 21 Apr 2026 17:09:17 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A370E43C8C3
	for <lists+linux-leds@lfdr.de>; Tue, 21 Apr 2026 17:09:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20ACD30E16EC
	for <lists+linux-leds@lfdr.de>; Tue, 21 Apr 2026 14:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C3153DA5C7;
	Tue, 21 Apr 2026 14:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JaFszFYD"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954803D9DDA
	for <linux-leds@vger.kernel.org>; Tue, 21 Apr 2026 14:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776783521; cv=pass; b=lYP5+0Ox9jufm0UoF1R4G/RGA9fqGCAra0fhs41FkZyQHVoK4JYh0sbfMhIQehUonnfnDuhqpya5M4LQ1Id+cSe4J0NBxxVMlRM+BEiE7a7dH0b4XlQ9/PhBXDPKzdNUoFKm24YgF20IfkBNJPgwCKF8Osq7NQVclAc5R2dnDck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776783521; c=relaxed/simple;
	bh=IktK0Ma4XtmCMwxrPYV5R8Ct/afKMQQHV4KvpEVehJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gWBsfqgph99prz3vp+IsF5v2XBaI4rFoQHOQRoMsi1w290r9NVesrWp6d3ZO5DEuKH6C9k4FzWMzhYp/ed/J6avZXitbCmfwbRYVUDV2m/OkMYQKepnZO7RKHmdDPnVVm9pB7zCO8mrAu5fpdyIrHq+eq7HKylxQ3bOVyCvl70E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JaFszFYD; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a40008be82so374554e87.3
        for <linux-leds@vger.kernel.org>; Tue, 21 Apr 2026 07:58:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776783518; cv=none;
        d=google.com; s=arc-20240605;
        b=AGCaMLoTQOUBeL7pYcV6WHm496CWadR3oXmdJJLSutZuFTtCpSrkfTag+19qVJFZyA
         AuWC3H59DORBcdsTG9GjZrGUbsLzRdP4gNgGDiFt7Mptgi7CfhSdO4PYLnCSuw2IKjAr
         +9sUc2SD+X4bT/ATwhKvI7+9NWanAmmqic8mHBvpk6sT3p4i+Fm9NgN+6bmfJuRzMMKz
         To2Tdj/RrSwP4Oa2812lyOYerRC3vBje/D0QazTYmqV8mjereHFiAb++V/naENsLg0nK
         Dtz9Dy9b4u4dgR373XJWOndyAUpMkBcP5mVdRS/uVCsNi6P5ZGXKinh3ceeZyMxP4GBB
         7n2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IktK0Ma4XtmCMwxrPYV5R8Ct/afKMQQHV4KvpEVehJk=;
        fh=tOHVs/Rb6DUnNa3IV64xopJMxqWVp9Hb2TgwbpkWoWA=;
        b=WXEkCX4nyAlaL2uTey31gPh2cxuXJWS2wW8yOMph7C3p+MfGYqw5OVn1P39RnLn82T
         ZZw9Msclhe5w/WvNtIliHz7lX5UGAdmNLqYDBjB/Izc0rS37sAMJayZYhPLttTgbtFFC
         tQhqIOqq9tMFiDLtvRjBPkNvFkMYgzVccPm3Z7B1P9EGsetvcjm5tvOGpc2uqsjATJeu
         Rw/aLejyT92Ba/3QM2r0egfEB7up1sG/P0HQvoiArvf+CJDQByaaIHiMhfF0S3kXjs2I
         sT2kbi3gpwUHAHhhk8kOYmfVtSIAbcHatEKMD7z+OA+rKMqeq1c2iBzO1L3adxJIeAPe
         bIkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776783518; x=1777388318; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IktK0Ma4XtmCMwxrPYV5R8Ct/afKMQQHV4KvpEVehJk=;
        b=JaFszFYDrshnwzFa3kQyqTJBIHAvDFqsjJcqq5bLvELWN0bwQQ/zDZ/tY7pEZdp7uo
         TxFX7zmJhMlmeQy64Lf6yyBm0n9V5P6D2Ik/De2Z1Z4hIH4ENXJP56UmkPOkfWNokCjI
         9wjSgCuEmpELtoGvM0+49oveIm2ECy394HDPeb7qhNxnB12/laI4jUh7gN+8U2vAlVDK
         V97lLZLHpAFw+PuFqlYZ6SlOUO+ci/Dwa8tJKgUR2QtKKBUEEedxxxHYztLe19AzIY5L
         5UidHlWqhfyt/zbea7e48poCO5Eh4VKb3j0PTITd73ELQLaep+xll1HTfCdAQwYjfD9G
         KR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776783518; x=1777388318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IktK0Ma4XtmCMwxrPYV5R8Ct/afKMQQHV4KvpEVehJk=;
        b=mm5H7QI9kIanmduWmHrx3HuXdQwUePzo7S1nXI/6FnY16Aien/SExdj6AOq/iXAuev
         JYyXQYxxeHZch/ctc1q7nYYhsymYxaLqb6Fj/DsI+V2H7Z14u3QH4jRENqvRl7KtVnmV
         g8R0vXK4KsKVz1AP5vYPc8A5kFGJzqi0NC/hwbRAbPK/x830SD5Cf2Rxg57GtjEHG0D2
         NcTR53H2K2LxxdKN5RpT+hM/NFF+r7MDlyXRIws703Io28K1JgvMM3JNoxVtrr1vMVEb
         TUW28ghKLcYl8lHw002GgAZslyCZNfemg1e6ww7jnTj1tV6x7s7G9T/nnBA7ktF0IK5V
         GP0w==
X-Forwarded-Encrypted: i=1; AFNElJ+qjj79qu8bc/bK6uKeJ/QJNvxGE8F220foYN75FJXHQ8mCTZiXHn5D3MiULbIlDY9ejFLB0oLiNwe8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2QtrDJM0n8+cJuANU0gr2kvr+BCGoyV8MfcrijcRM8hN9y3VU
	7/sG1WraqW44LVarolkCjo34axC2fhUznOtrHKLAueSv3O0x3utZm2R6L80bgmdiFwThOfoLz8l
	i1lEsvg3K94r+ytWBuZY7QYY3f7TGjLU=
X-Gm-Gg: AeBDievrUM+sDJBWvIHRRzv4bGZ2T6cleNGfYIfS8LN9P1ORHViLLaFojmWMl1iI7aT
	jzYY9NO77b5dWHw2VShAAwACwkP4+wY4QlMRjW2C1PQ/ZR8yrf/McdXvCT4DpLzImLox8Ng9FL/
	l/UjyXJw44mfyPWJqzIyPoc/JghdZEmEppvSF72iWikpyuTbP9pEdtkHhDICKmyZ5pyiYtnzMQs
	Yuv3uP/HT+Droubpyk8OoSyj4rAcnoafbCT05Dv2Hkbi4JCLJLeszwqNe6lcDRxlTUjZd/RK8oj
	OPyYt5any/BN97eGE4a+ohNrcsOfBlpXjWWmNGhw5FG6h1RiTsijTUCjwil7djx2cR88npHVRfY
	1sEq5yeSVwzmIu9kF/7qWtcd2xOwm31sjSQ==
X-Received: by 2002:a05:6512:3087:b0:5a4:1099:b16a with SMTP id
 2adb3069b0e04-5a41728bbfdmr2620883e87.0.1776783517486; Tue, 21 Apr 2026
 07:58:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420-synology_microp_initial-v8-0-7946a9124491@posteo.de>
 <20260420-synology_microp_initial-v8-2-7946a9124491@posteo.de>
 <6104a5fe-a6e3-4c35-ff4f-731d1a5e4acb@linux.intel.com> <c4964138177c4455f5eb07d0e23db2dfec40bf9c.camel@posteo.de>
In-Reply-To: <c4964138177c4455f5eb07d0e23db2dfec40bf9c.camel@posteo.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 21 Apr 2026 16:58:19 +0200
X-Gm-Features: AQROBzAd0frbr7R0K910eLnzr-MgLF13a89W0lNL0YdA7DVIARYBXkrGGHdY4e4
Message-ID: <CANiq72=P+bA_eR5xd9rCXio_kBY_p8ehgRyCWN-KTpZDVfiusQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] platform: Add initial synology microp driver
To: Markus Probst <markus.probst@posteo.de>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hansg@kernel.org>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, platform-driver-x86@vger.kernel.org, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7787-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,linaro.org,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A370E43C8C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 4:17=E2=80=AFPM Markus Probst <markus.probst@posteo=
.de> wrote:
>
> How about `const BLINK_DELAY: Msecs` ? The unit would be implied
> through the already existing type alias `kernel::time::Msecs` for u32.

Ideally we would use strong types for things like this, i.e. Rust
newtypes, rather than using type aliases.

e.g. see our `Delta` type.

Cheers,
Miguel

