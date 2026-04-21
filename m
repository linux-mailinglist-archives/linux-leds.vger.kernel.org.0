Return-Path: <linux-leds+bounces-7797-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QK1pMJbG52mCAgIAu9opvQ
	(envelope-from <linux-leds+bounces-7797-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 21 Apr 2026 20:48:54 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E5B43ECC5
	for <lists+linux-leds@lfdr.de>; Tue, 21 Apr 2026 20:48:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B93D6301A3B9
	for <lists+linux-leds@lfdr.de>; Tue, 21 Apr 2026 18:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0136D3DA5B7;
	Tue, 21 Apr 2026 18:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lY2hPFkR"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3FC3750B6
	for <linux-leds@vger.kernel.org>; Tue, 21 Apr 2026 18:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776797235; cv=pass; b=aRIXYLEvQ1crIcS1d1lLXu+5tXO2oG2wYGgqIcrI4ykvhpmBN5lKFkXtPzqu4UN0JmT5fqEIGKLDApKIajnX7Ib57BIpUgFXTpoN8EHtMO0EyIw0ckZhewroa/yfmac4qwSkU0q/fl49ip73e2GMWHHaH98uvJx1Z3PqkhOrOOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776797235; c=relaxed/simple;
	bh=nxMVd9OHSpuGcSYtsfr53tYbcrChA8wOvkQbNhNm+r4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V28IkH81hPSeTl/qsQuqPm2l28AnXQh7baIGyjMf7k7QfPGJJekuLwIWt72Mf7BQezDN3kVfQEgqxFXwM3OMDCIzHuwHLiQ1dpjhtY8t+ZPWGKC6qNMCOiMv/xxlTCqbKHuv80CZnXtqmUF3vPcJ0xMLn0KSoJtkMsJEPAov+KM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lY2hPFkR; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12c8ed67dccso181326c88.3
        for <linux-leds@vger.kernel.org>; Tue, 21 Apr 2026 11:47:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776797233; cv=none;
        d=google.com; s=arc-20240605;
        b=Up+dto2wNdmUH0a7kfbvNuTqwAP2+fiG9Ez15Ax2SVAvfdgGFcTgcC3umv9or3Czml
         /CTrAd5NRTf8hw8OwJhZPzWkUeuNQl7zOtVi/JqdvTm8ScYpujnv9wgKWFh80q9FvSv0
         KPEpvcQfoOyPccTNNh1G6HaJ1e6XguL/3knCrPitMNx/Tidm5E5c5cJTsGrV2stLq7zB
         V0jUp279iTEwKW2lEuyFiLehTVIf2YEV3k9J8Bn+qE+8RZYFQEI0DWlq5pUNmvrK4U+Z
         WZaqQr1g7niB3iiJf9ZJtohfPvmWn7jyNG0LBt6pqYW9293c/ar6sYRpNcYjhqLov5uo
         kYow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nxMVd9OHSpuGcSYtsfr53tYbcrChA8wOvkQbNhNm+r4=;
        fh=epSyu2taP6nQoDqAwGrB+1qT1TgKCxRwllronbXjOKg=;
        b=kZW4SBjT5LdP7ze/ceGqAUFRevpR4TCI9rQ/KPjytJq0MXhmnPmHCMIaMyKv8y7rYt
         pI0kAjGQlrKQVS1toJXfvDs4OLVhcZQz+px7TwGdKbWyts82yz39NwnJ+i8Q6aIwylfY
         MQakyfauq4Hu3NgczemznchFZc49phgqC5BPURK2C6+3nqFdAWBKCgIq4kjG3GmQoF05
         9tDLmEGWmK3orP3bM0I+NCuEI2WhXanJZu6CiIp8SFYmFXY9m2egTZrFZ8MHKOaXmp2t
         XUKoEmtD161T6o3WrVtSf+Xz8SrRGmpM7AwZ975MVwzkTgkdtbaiEZhVQrGShP7KBprp
         fsCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776797233; x=1777402033; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxMVd9OHSpuGcSYtsfr53tYbcrChA8wOvkQbNhNm+r4=;
        b=lY2hPFkRzSq0i1RtibAyiaYlSfJT9MCga6ODlOILOzE3hy3pzy1KE1XhdjDDOhFtCy
         NQpH5CwR6RJu9e67ONSkgrVu8NTubVsEdi25y5VmxyJkAmDCwh+lWkJwaQmPHIwbmroT
         PS4IrEXF7GZoTZWqGbunpMBr6IcFcqAsNsGGbAXuxhPQOUUpLTcSyyxgyzfvtWBAVjiB
         kAzh4b7q+msAEnoXUPhvFES/5vrMq69RPJ6eeZX63CsGe/idjCcrOltXmlWosmnUBj7c
         ppGhVvypCTYjmoWOdwo0EXMZ0PCgmWSB/+ucyZc9i957cNGUmYmalruc9hxNvLd/nHsI
         kUdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776797233; x=1777402033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nxMVd9OHSpuGcSYtsfr53tYbcrChA8wOvkQbNhNm+r4=;
        b=kwhjfUkCH/Ftg2mefxIobMf5FKL8sgpuEBr1BaW3kvBOj4xgAI8GentQ/7E9GNNQ22
         Wsdu7tskenKPs5PoSGJXxXlTHVfU/0I3tIDe5H7kIAw12JcrvHXvR1b6AV5/GRovB8YE
         Zlwr2nW+kKlsqkuwwGeLtkbxmrKs5mtJDuPJ0RgpbjGv7yIXAf2lbNHO6TulyhllclER
         VNDicnJqDz6aQ0Pgjmo+thEuEAKv+Bkwf5Y5duhbbCg8NfH17KH0vSlEQR5+HU4LsU1g
         ITAxnMiIpHArA3NCb5Iy3O6AeN23ZWayZxKIkRTjTYNyptgm7fLTRmzlatrJF6ORLkmO
         LB3g==
X-Forwarded-Encrypted: i=1; AFNElJ8N+07PvJcq3maicWnXkSl72FRPatrNozJ38maHolxqQKkLdxa9lJyYxUcf7Gn++2tq3vJXs4oqKzwE@vger.kernel.org
X-Gm-Message-State: AOJu0YyCeAVWAFGNclUcFUkih/FJY+A4PZIj/yOaGkklABX7GmGsEzK8
	OrgX7uMh1tZM1K7KjZRg9u/I1uUiJY8zDl1d4N0a1gadgQIj5RCWcN/32dZO5hc5xyF/nGxf8qO
	sk8NyJ3SVdWEZA0AJGqrL5MU1s4c5e+A=
X-Gm-Gg: AeBDiet4NJZIQVIKroMyuQcwJXTRRcWHL7hit/hRaiK7VzqnOpUtPS5TArQ6TY5B/O5
	5LXC2zCU8npnx53/1SLvbg7PJqeuynAj/9f/6NGJZCidHrLgWM1N+C0Oi4JGFcqJmujwVauy7QO
	VvIt3ei+gadD3MgYCs4I2MGpLzr9MQvuXgZ7MfFjSIf0ffHcJMAO/9DV+Al5PxSyQe/DUQqKllt
	G3PdJXJxjRICPBUVBoplMvqw4wprdwQy47J6XpHEF0g4Mwygkef6DuyAIWf/lC1DoLVofREbIco
	hDP5gsskFftnHeEFv8AESo7hxQ4Wpv2zI3l1eMuLKKd6sDWmMXk/0QAFWdQIK2BO+ufVcq/OytX
	hB6l/Vr/zIue2zBdggogvYWIBVCIjiheHAjSn/Zj9xiTe
X-Received: by 2002:a05:7300:fd07:b0:2cb:8d2f:e235 with SMTP id
 5a478bee46e88-2e466043efemr3780881eec.1.1776797233495; Tue, 21 Apr 2026
 11:47:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420-synology_microp_initial-v8-0-7946a9124491@posteo.de>
 <20260420-synology_microp_initial-v8-2-7946a9124491@posteo.de>
 <6104a5fe-a6e3-4c35-ff4f-731d1a5e4acb@linux.intel.com> <c4964138177c4455f5eb07d0e23db2dfec40bf9c.camel@posteo.de>
 <e166861c-e75d-d1c2-61e8-f611e6ee1ef2@linux.intel.com> <1cc39657ac50f3930dfa27de41a1b4605a7167d9.camel@posteo.de>
In-Reply-To: <1cc39657ac50f3930dfa27de41a1b4605a7167d9.camel@posteo.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 21 Apr 2026 20:46:59 +0200
X-Gm-Features: AQROBzD7jw36OIB5Thxw8iYFM3lU80V29LqkzQd_l1DKXUW04JWxY4nHk4yFQzg
Message-ID: <CANiq72k=8fmi0fJnNV=GgR5_HO_COWGynKDF-xzoX1nDAdxdrw@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] platform: Add initial synology microp driver
To: Markus Probst <markus.probst@posteo.de>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hansg@kernel.org>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7797-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[posteo.de,kernel.org,gmail.com,redhat.com,linutronix.de,google.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[31];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,linaro.org,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,posteo.de:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 26E5B43ECC5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 8:21=E2=80=AFPM Markus Probst <markus.probst@posteo=
.de> wrote:
>
> Delta stores it in nano seconds, so it will require an additional
> `.as_millis()` call on use. I assume rust will optimize that out, so it
> will be fine. I will use the `Delta` type like Miguel suggested in the
> next revision.

I think it should (at least in the 64-bit case -- we do have a
`bindings::` C call in the 32-bit case, so likely not in that case),
but please double-check the codegen.

In any case, my suggestion wasn't necessarily about using `Delta`,
which is definitely an option to consider, but rather more generally
about using newtypes, e.g. it may be that we want to have a few simple
time unit types (probably with support for `const`) for cases like
these if people are going to use primitives everywhere to define their
`const`s -- Cc'ing the timekeeping Rust folks.

Thanks!

Cheers,
Miguel

