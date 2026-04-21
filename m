Return-Path: <linux-leds+bounces-7796-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMy7NdLD52nuAQIAu9opvQ
	(envelope-from <linux-leds+bounces-7796-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 21 Apr 2026 20:37:06 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C6343EB6C
	for <lists+linux-leds@lfdr.de>; Tue, 21 Apr 2026 20:37:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 234F630179C7
	for <lists+linux-leds@lfdr.de>; Tue, 21 Apr 2026 18:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADB6437C91F;
	Tue, 21 Apr 2026 18:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IL5c/WE8"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CC4372ED7;
	Tue, 21 Apr 2026 18:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776796621; cv=none; b=G/DePrgtSEz91Z1b56hcrPo53BvLqDsG5wLkwKmh7ix84kG8gbbHwjySMxIrOU4qgrc3yG9AoFWWRwg4kn8tPo/zwBGfKbGaZ8D76A9XKe8yL9Mf/O3bBQbOSkZd1FfEFLJodlUoKxGszb7F0XG5NXqVas1xkMF3PctCwMIAEns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776796621; c=relaxed/simple;
	bh=nsAJlvZaoRqjWzwDu8wN2hnZIZWp3b5TT0kiRhM/c04=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=KKbtF5U687O6kLzGlozQYd5bU7f8QM1wjOvH7ANCl3s7+HZ3C0BmGZ/zGD8aDCviFIt1+dxtII/ceBg5HOrjQMt//coKXQFUH5UGbsvmNXk8AmtHFCthTYQvLD4vyngcWuY22RXchRAmpHbAG9snReE9WBDhU73mLbW2gYOxUH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IL5c/WE8; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776796615; x=1808332615;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=nsAJlvZaoRqjWzwDu8wN2hnZIZWp3b5TT0kiRhM/c04=;
  b=IL5c/WE8nYs6nGdy3xnSabdk7c0TlFcCw23f2e7/vlnSnXCpZ3V6nrMm
   g9IFFWoD5e5CyDswb60iIJQOfBCy2YvjTTwK1ydxIvB68OzoI/qnaNQR6
   2gScIYmH5xRkycgRC+XB9U4RVuP/XcOriYB7AQTwD7gSh5o52K+20Pmmb
   fPYk5/wZ/Q/owHV56rgxPj07qD0hGgSPmrwOWlChVonabs2EGnInWxu6n
   4FN0IdIw3MVMY6KZwhVD0jWmAX6WGL5cQTZSy6t9QPDxJYaic4i72zQcU
   C6Qo7jf1/Lq3bufzWs1rB0VF1f4n+CSDpZ5TGdd7hbhwlB4mV5U7ECxpl
   g==;
X-CSE-ConnectionGUID: ufWi67EyRAO2zUL17z8HYQ==
X-CSE-MsgGUID: xEerVYcjRpGB+IqSeKQ6jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="100400827"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="100400827"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 11:36:51 -0700
X-CSE-ConnectionGUID: iIGHsrCJT7i31+GiNoXViQ==
X-CSE-MsgGUID: cHtQWGqHRK6KgGIy3f/OlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="237094542"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.105])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 11:36:44 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 21 Apr 2026 21:36:41 +0300 (EEST)
To: Markus Probst <markus.probst@posteo.de>
cc: Hans de Goede <hansg@kernel.org>, 
    Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Lee Jones <lee@kernel.org>, 
    Pavel Machek <pavel@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
    Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
    =?ISO-8859-15?Q?Bj=F6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
    Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
    Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
    Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, 
    devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v8 2/2] platform: Add initial synology microp driver
In-Reply-To: <1cc39657ac50f3930dfa27de41a1b4605a7167d9.camel@posteo.de>
Message-ID: <da91c6f9-5eab-ae5f-9178-3eab1d96dc57@linux.intel.com>
References: <20260420-synology_microp_initial-v8-0-7946a9124491@posteo.de>   <20260420-synology_microp_initial-v8-2-7946a9124491@posteo.de>   <6104a5fe-a6e3-4c35-ff4f-731d1a5e4acb@linux.intel.com>  <c4964138177c4455f5eb07d0e23db2dfec40bf9c.camel@posteo.de>
  <e166861c-e75d-d1c2-61e8-f611e6ee1ef2@linux.intel.com> <1cc39657ac50f3930dfa27de41a1b4605a7167d9.camel@posteo.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-843182584-1776796601=:972"
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	CTYPE_MIXED_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7796-lists,linux-leds=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+,1:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilpo.jarvinen@linux.intel.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:email,intel.com:dkim,infradead.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 46C6343EB6C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-843182584-1776796601=:972
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 21 Apr 2026, Markus Probst wrote:

> On Tue, 2026-04-21 at 21:10 +0300, Ilpo J=C3=A4rvinen wrote:
> > On Tue, 21 Apr 2026, Markus Probst wrote:
> >=20
> > > On Tue, 2026-04-21 at 14:59 +0300, Ilpo J=C3=A4rvinen wrote:
> > > > On Mon, 20 Apr 2026, Markus Probst wrote:
> > > >=20
> > > > > Add a initial synology microp driver, written in Rust.
> > > > > The driver targets a microcontroller found in Synology NAS device=
s. It
> > > > > currently only supports controlling of the power led, status led,=
 alert
> > > > > led and usb led. Other components such as fan control or handling
> > > > > on-device buttons will be added once the required rust abstractio=
ns are
> > > > > there.
> > > > >=20
> > > > > This driver can be used both on arm and x86, thus it goes into th=
e root
> > > > > directory of drivers/platform.
> > > > >=20
> > > > > Tested successfully on a Synology DS923+.
> > > > >=20
> > > > > Signed-off-by: Markus Probst <markus.probst@posteo.de>
> > > > > ---
> > > > >  MAINTAINERS                                        |   6 +
> > > > >  drivers/platform/Kconfig                           |   2 +
> > > > >  drivers/platform/Makefile                          |   1 +
> > > > >  drivers/platform/synology_microp/Kconfig           |  13 +
> > > > >  drivers/platform/synology_microp/Makefile          |   3 +
> > > > >  drivers/platform/synology_microp/TODO              |   7 +
> > > > >  drivers/platform/synology_microp/command.rs        |  54 ++++
> > > > >  drivers/platform/synology_microp/led.rs            | 281 +++++++=
++++++++++++++
> > > > >  drivers/platform/synology_microp/model.rs          |  49 ++++
> > > > >  .../platform/synology_microp/synology_microp.rs    | 110 +++++++=
+
> > > > >  10 files changed, 526 insertions(+)
> > > > >=20
> > > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > > index c1c686846cdd..49f08290eed0 100644
> > > > > --- a/MAINTAINERS
> > > > > +++ b/MAINTAINERS
> > > > > @@ -25555,6 +25555,12 @@ F:=09drivers/dma-buf/sync_*
> > > > >  F:=09include/linux/sync_file.h
> > > > >  F:=09include/uapi/linux/sync_file.h
> > > > > =20
> > > > > +SYNOLOGY MICROP DRIVER
> > > > > +M:=09Markus Probst <markus.probst@posteo.de>
> > > >=20
> > > > You should probably add:
> > > >=20
> > > > L:=09platform-driver-x86@vger.kernel.org
> > > >=20
> > > > Through which tree the patches to this driver are generally expecte=
d to be=20
> > > > picked up?
> > >=20
> > > I suppose platform-drivers-x86.
> >=20
> > Okay (with the platform drivers maintainer hat on). Just don't expect m=
e=20
> > to have deep Rust knowledge.
> >=20
> > > The driver itself can be used both on
> > > x86 and arm64. Although I also have seen Synology devices with PowerP=
C
> > > (no device with PowerPC is supported in the driver yet).=20
> >=20
> > In practice platform drivers scope has already expanded beyond x86 so t=
he=20
> > platform-drivers-x86 list naming is just a historic artifact.
>
> Does this also include the drivers/platform/x86 folder?
>=20
> Because of the multiple architectures, I put it into the root, i. e.
> drivers/platform/synology_microp/
>=20
> Is this fine or should I move it into drivers/platform/x86 ?

No. The current place you have it is fine with me.

There's actually a small number of files that have migrated away from x86/=
=20
when they've become useful for non-x86 systems.

> > > > > +S:=09Maintained
> > > > > +F:=09Documentation/devicetree/bindings/embedded-controller/synol=
ogy,ds1825p-microp.yaml
> > > > > +F:=09drivers/platform/synology_microp/
> > > > > +
> > > > >  SYNOPSYS ARC ARCHITECTURE
> > > > >  M:=09Vineet Gupta <vgupta@kernel.org>
> > > > >  L:=09linux-snps-arc@lists.infradead.org

--=20
 i.

--8323328-843182584-1776796601=:972--

