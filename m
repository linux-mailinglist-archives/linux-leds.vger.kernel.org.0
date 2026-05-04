Return-Path: <linux-leds+bounces-7968-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IM49FUMw+GnsrAIAu9opvQ
	(envelope-from <linux-leds+bounces-7968-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 04 May 2026 07:36:03 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 967BA4B8912
	for <lists+linux-leds@lfdr.de>; Mon, 04 May 2026 07:36:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 356973000719
	for <lists+linux-leds@lfdr.de>; Mon,  4 May 2026 05:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6810327380A;
	Mon,  4 May 2026 05:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jnm8rR3e"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100261DC9B3
	for <linux-leds@vger.kernel.org>; Mon,  4 May 2026 05:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777872958; cv=pass; b=HhobshqkZd9zgwg0tzvEuDqQisxjhHoJTBCZerHE5ScAHZaXOEcqDy5HlhlMgrGMIsWuf1ppikh3lt1LBjr0PXPdnfbUiqw3fMODe5WrBq1DbcSQOMkR35MgmtzbeU3S/A4ptpKKM7i6dkFBpjZXgJDUnrDleLbgfaVjf6gwT/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777872958; c=relaxed/simple;
	bh=PpX/DfNN+JlZDcRUbM/17IG5CRLJ4dln0yK2qRlnbws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eeplGZ3fnEYNbJPkhhbVmzp8hHuUg9fOClPpNTcXiGKxbdVcpZ2gLUuTZnI93MNCCGQLiOmDFvAti1NZmNJrmm9H0pyE7917gR+iOh99qs3Ro79H09QmBbu44MLZR6imOlS/CXV9FtUcXVRVYFTTkoMtFzCahVcR5/lav9OINQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jnm8rR3e; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2ecf9e398f4so8428814eec.1
        for <linux-leds@vger.kernel.org>; Sun, 03 May 2026 22:35:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777872956; cv=none;
        d=google.com; s=arc-20240605;
        b=IWSAUh3dLVWUkNWLqsz3UGky5YRnP5ip9oIFB1DqScX3ZBhKSfpedOU2V7Gmt2xfW1
         FSRPqSkcuvNSOWKRKOpLrTGcU2CvyyriVu/Mr+IINpmawLdBfD9Jyq0C0L4oo4UgV/js
         Sss9El38lm1rBft5KvvVwFQvQ262YjFD4hbnNF5OjiimYFHMadTsteRXfryeKXvjs3sz
         boN1BM2AJCdRH31HcJMcOHZOW1CDWUiz/a6/WGcZ0aZxqtWUpnF8R1xfe9VL9FTsdBXD
         0iE02p7f6+pFmhuZjRBGpksAn1nfBc4coBnBmUesOmvGJ+m79OWP6tjio2iX7ARaQbwV
         GpxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1uBbstHeNNetK026aMIZ9O9biz0TfRbnDvaNXtEoNZw=;
        fh=g3ilx39Qp8m3hippTb65gfTdhsU1kVtBbIV8W2pKfCk=;
        b=A7I5VV3AO+zDpMaoU2wVo7NptmeZfnwEDKfjwQeTdNsFZB4ecDYyuzDp6kd++/UKiQ
         HJPqKIoVAA//fpD1qUiTYsqyFfclJlhT7elLvvxWyzAb9zznyMJ4fVaRgVIfvMxuPNdw
         /N6P9y1Jmna2nNZfRJKkgB2wpwKrkbzHCJVkVtF2HdVMWTKC0JyD7WDgeQbSMU8dof9r
         xvD1Q2mZ6eq6OLHTF6wdl5vJjpY/OHmanUGLet8bqFumymgI7ynXrbf0qvAFD5H/iL0u
         KTeSOjsKrAb5801YJfHIdrkfMU+2nvF0LfH+KG+wXwaO521wIvXZPRRoZGvdWCDLrF0o
         A4Dw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777872956; x=1778477756; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1uBbstHeNNetK026aMIZ9O9biz0TfRbnDvaNXtEoNZw=;
        b=jnm8rR3eGBVNrd3NIS5A3I651kNMOQ/T5/9+VqCNHcZULwlLqoZfsB6UTqjkjSEJ1m
         hRfnOlEZnyYnOWq5GqsZ+Prd1lY/T2ZrnErQkOQjh7q8O4LrytGlTT6mWhqoASRW/7K9
         vIIxMDnMT9cAgEaZpflqm/cwinoiBYnPY5zviBZDsAeSIu/yry9/RY7dUACgfNTTC45I
         neWZDzjUX9z1mrWcOcRoMqO9VKJaiC3XNi+yCxZif5vYxdUOzonXBuvuGHIZauVQnibz
         4xuIG8jXSBKWrnLAFe7tVUCfRusLzKEl5GXQxnB7H8XNKucZDVi1yzkXti1W2y81E5ob
         cIYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777872956; x=1778477756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1uBbstHeNNetK026aMIZ9O9biz0TfRbnDvaNXtEoNZw=;
        b=MuLpx9wp0Icquc/HPPgXssoQAwOTKRyY10eoPtZrPs4OI8X+zBowJno6hJDCONOFtZ
         iSvOAyABvdGl44n8PM2nDtDSIBqKHFiTU3gX9jmDVSF0EtfBHCEPf/T0oebZPFEsfVQI
         xxA3sCSqsklqbA7U7VLCZVeSeWrz4YV7uu0L3XJaYuCbiVZe/n8+ll5Q9HDYU0ToTD/W
         AFPUK1wVXqvxKktn1LKesnRN7w+e3TvGNUJH8UTg5YJrQVQwpL1mNbD9rZ3TPrQbIk7G
         JQoD99O4Nark+LBly6MSrnyfvACrn+PJXdoq6OI4hrgBij7pGP9G1zP9yZGEA9a7/Ik1
         j2Uw==
X-Gm-Message-State: AOJu0YxRDXIUQoFa/co9vr29LoQVQ1EiPAghe+QsoU7cFrLZ0pT/Pz4X
	9MFoxgF7kjYRMvnfXEOaEBG+3teHdqj8YjD/HeErcGMu4p4odt+U0+tN/eCXrxQJ3BatXH3maKU
	X5TITToQRLaw61KZE/B0fD2tooml27b0=
X-Gm-Gg: AeBDieuDB9iPC1z3GQFeEXxR4oDjk4CGTKvi6/t87I6Lm2pvZKTGg9oPRYFNUSuNrDZ
	yltY63UQ7EYwZdwR1a0TptHDHeLXntVmWrDzl4eVWFdbl0BGK681kfRin7Qu70HXkg+3y/+0N/f
	lMzl3ZK3BZs9DIsrRoEQFljJ5I9P10xcYYnwqHkaTIXqn+388RrgPq8djk4LHrEP3DaAEVdZv9N
	X2myYcCzD4JzO4sHi/vB8Sa7TZQN6l8PiZxfnyOkzVhI7PNoCIF0d8s/SdHZtsGih1RgWDdMNoQ
	jBSzFpHUGIQJKi9SMRo=
X-Received: by 2002:a05:7301:9f06:b0:2be:142f:d499 with SMTP id
 5a478bee46e88-2efb99a10e1mr3875589eec.16.1777872956015; Sun, 03 May 2026
 22:35:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260503164445.215540-1-clamor95@gmail.com>
In-Reply-To: <20260503164445.215540-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 4 May 2026 08:35:44 +0300
X-Gm-Features: AVHnY4IMnap_ID5NH1mOwy7Jn90ifX2mwZC9TXCzuL0FMjV669mX99tEoP4MgoQ
Message-ID: <CAPVz0n1n1qrA=VdCGCwYcGFBfN6aaTULq9OKVa5=mmHMFNkDvQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] media: lm3560: convert to use OF bindings
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 967BA4B8912
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7968-lists,linux-leds=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

=D0=BD=D0=B4, 3 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 19:44=
 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Add missing HWEN input pin and IN supply. Fix v4l2 subdev registration.
> Remove platform data and switch to OF device tree bindings.
>
> ---
> Changes in v5:
> - schema adjusted to take into account lm3559
> - device_for_each_child_node > for_each_available_child_of_node
> - lm3559 and lm3560 configuration was diverged with data match
> - removed redundant header
>
> Changes in v4:
> - fixed current being off by 10 in schema
> - label property from schema replaced with modern equivalents
> - lm3560_init_device moved before subdev registration
> - v4l2_device_unregister_subdev > v4l2_async_unregister_subdev
> - added subdevice cleanup if second led registration fails
> - added check if "reg" property exists for LED nodes
> - added missing fwnode_handle_put if device loop fails
> - added bitmap to monitor configured LED id
> - added pm_ptr() macro for PM operations pointer
>
> Changes in v3:
> - added note regarding lm3559 in the schema commit
> - lm3560 power on/off functions converted to be part of PM,
>   dropped redundant wrappers
>
> Changes in v2:
> - vendor properties swapped with generic LED properties
> - added mutex lock usage optimization
> - power supply and enable gpio commits squashed into PM
>   configuration since they are both required in making
>   proper on/off sequence.
> ---
>
> Svyatoslav Ryhel (6):
>   dt-bindings: leds: Document TI LM3560 Synchronous Boost Flash Driver
>   media: i2c: lm3560: Fix v4l2 subdev registration
>   media: i2c: lm3560: Optimize mutex lock usage
>   media: i2c: lm3560: Convert to use OF bindings
>   media: i2c: lm3560: Add support for PM features
>   media: i2c: lm3560: Add proper support for LM3559
>
>  .../devicetree/bindings/leds/ti,lm3560.yaml   | 163 ++++++++
>  drivers/media/i2c/lm3560.c                    | 385 +++++++++++++++---
>  include/media/i2c/lm3560.h                    |  84 ----
>  3 files changed, 481 insertions(+), 151 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3560.yaml
>  delete mode 100644 include/media/i2c/lm3560.h
>
> --
> 2.51.0
>

Hello Sakari!

During preparation of this patchset 2 important issues were not
tracked and discovered only after sending.

1. In "dt-bindings: leds: Document TI LM3560 Synchronous Boost Flash Driver=
"

flash-max-microamp and led-max-microamp ranges of lm3559 and lm3560
pattern properties were swapped.

2. In "media: i2c: lm3560: Convert to use OF bindings"

In the lm3560_probe struct device_node *node should be removed and
for_each_available_child_of_node should be replaced with
for_each_available_child_of_node_scoped

I am sorry for this inconvenience. If you find it suitable to adjust
these commits on apply feel free to do so, alternatively I can fix
them in the next iteration.

With best regards,
Svyatoslav R.

