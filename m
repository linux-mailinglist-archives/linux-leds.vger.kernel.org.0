Return-Path: <linux-leds+bounces-7593-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDIxMnmmymmx+gUAu9opvQ
	(envelope-from <linux-leds+bounces-7593-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 30 Mar 2026 18:36:09 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D3835EDD7
	for <lists+linux-leds@lfdr.de>; Mon, 30 Mar 2026 18:36:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FC183028B14
	for <lists+linux-leds@lfdr.de>; Mon, 30 Mar 2026 16:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD0CA3859FA;
	Mon, 30 Mar 2026 16:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a5eUi0Ii"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889AA270EC3;
	Mon, 30 Mar 2026 16:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774888318; cv=none; b=ASH6D+cQpJ6DRqLqNFWOehKYFPD1Z1XtSjBjGSY5uSXpjGq++WcYjTrhpvEbS1wcT5V8XaSPgYvnBRm3AQQo3ExJJ9U5RdjSok0cnVQgGDKf7iMBkaLbsjv+S+xCgvv0G4NRTqYupxWqErjk72UNxtT3dvbjdcU51gnosaQyclM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774888318; c=relaxed/simple;
	bh=SRDf0GTu4OPnEjLFDGhjlwNkORc3ZV3jFuzbHc7pPv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oCnt17bEA8LneFdwHYhhpofin35wegHT/0jUp/Yw73H1lK9H9m3oXZ0UiZrs5+0MMM4aTHIeA+tFmHyzB0GcK9QK0vTgtww4iX/jMg4mPKAPhr0j1NfREUgvegkv2tMeRhwOdfFLf8mN/GC5d8Uhh9zV9WPkg5kKFKN+8nAYclk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a5eUi0Ii; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42FA5C19423;
	Mon, 30 Mar 2026 16:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774888318;
	bh=SRDf0GTu4OPnEjLFDGhjlwNkORc3ZV3jFuzbHc7pPv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a5eUi0IilhDO1qm4GDUoY0gPuWKmmVphAikH7fxldoBSW1IByxBLpihzcOBaEfvVt
	 X6XpRx71wLZkAMwoVwf2XPPW22w9I6N0Y0QJleFueWSuWd9uCUU3M8IEHwY43pKtOv
	 ZVwE+jnmUV7LCO6VHVLBlDOSnM52OPikwTT7f1cW0fE3eldU7S8a/+E5AB1YCzoJlM
	 XAHdh6H8FtT3lDVJBIyJxJ+NZPiLgyI6WbRGTui89q/XG2CpLsNaFBFTT90J2YB0mZ
	 BH3B4dMlcQLDnE89E75T7nm0fZF+QVaukNqfbTg/0K0d0EOQwvvFsxVL/YaLPGK43F
	 w28gmeAhIUo/g==
Date: Mon, 30 Mar 2026 17:31:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: markus.probst@posteo.de, Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
	platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v5 4/4] platform: Add initial synology microp driver
Message-ID: <20260330-unrefined-headache-f640bc70a46a@spud>
References: <20260329-synology_microp_initial-v5-0-27cb80bdf591@posteo.de>
 <20260329-synology_microp_initial-v5-4-27cb80bdf591@posteo.de>
 <6d2fb01a-216b-4f51-8a26-527d724002d7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2xLiGAbObogF50Js"
Content-Disposition: inline
In-Reply-To: <6d2fb01a-216b-4f51-8a26-527d724002d7@kernel.org>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7593-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_CC(0.00)[posteo.de,kernel.org,linux.intel.com,linaro.org,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 30D3835EDD7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--2xLiGAbObogF50Js
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 30, 2026 at 08:51:14AM +0200, Krzysztof Kozlowski wrote:
> On 29/03/2026 20:02, Markus Probst via B4 Relay wrote:
> > +
> > +kernel::of_device_table!(
> > +    pub(crate) OF_TABLE,
> > +    MODULE_OF_TABLE,
> > +    Model,
> > +    models![
> > +        apollolake @ [
> > +            ds918p,
> > +        ],
> > +        evansport @ [
> > +            ds214play,
> > +        ],
> > +        geminilakenk @ [
> > +            ds225p.led_usb_copy(),
> > +            ds425p,
> > +        ],
> > +        pineview @ [
> > +            ds710p.led_esata(),
> > +            ds1010p.led_alert(Color::Orange),
> > +        ],
> > +        r1000 @ [
> > +            ds923p,
> > +            ds723p,
> > +            ds1522p,
> > +            rs422p.led_power(Color::Green),
> > +        ],
> > +        r1000nk @ [
> > +            ds725p,
> > +        ],
> > +        rtd1296 @ [
> > +            ds118,
> > +        ],
> > +        rtd1619b @ [
> > +            ds124,
> > +            ds223.led_usb_copy(),
> > +            ds223j,
> > +        ],
> > +        v1000 @ [
> > +            ds1823xsp,
> > +            rs822p.led_power(Color::Green),
> > +            rs1221p.led_power(Color::Green),
> > +            rs1221rpp.led_power(Color::Green),
> > +        ],
> > +        v1000nk @ [
> > +            ds925p,
> > +            ds1525p,
> > +            ds1825p,
> I don't see any compatible strings here. Actually, nowhere in the
> driver. If that's how you write Rust drivers then NAK. Compatibles must
> be greppable. Not only for humans but also for ABI check.

The code immediately prior creates a macro, which is called here to
produce these. This macro is barely grokkable to begin with IMO, but
you can see the DeviceID::new() call down there that creates the
compatible using string concatenation.

Definitely on the same page as you about compatibles being greppable.
It's not as if it is difficult to create the list using vim or whatever
code generator llm you wanna use. Probably making the macro was more
effort than writing them out!

+macro_rules! models {
+    [
+        $($arch:ident $(.$arch_func:ident( $($arch_arg:tt)* ))*
+            @ [
+                $($model:ident $(.$func:ident( $($arg:tt)* ))*, )*
+            ],
+        )*
+    ] => {
+        models![
+            $(
+                {
+                    Architecture::new()
+                    $(
+                        .$arch_func($($arch_arg)*)
+                    )*
+                }
+                @
+                [
+                    $(
+                        $model $(.$func($($arg)*))*,
+                    )*
+                ],
+            )*
+        ]
+    };
+    [
+        $($arch:block
+            @ [
+                $($model:ident $(.$func:ident( $($arg:tt)* ))*, )*
+            ],
+        )*
+    ] => {
+        [
+            $(
+                $((
+                    DeviceId::new(::kernel::c_str!(
+                        ::core::concat!(
+                            "synology,",
+                            ::core::stringify!($model),
+                            "-microp",
+                        )
+                    )),
+                    Model::new($arch)
+                    $(
+                        .$func($($arg)*)
+                    )*
+                ),)*
+            )*
+        ]
+    };
+}


--2xLiGAbObogF50Js
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacqldgAKCRB4tDGHoIJi
0rftAP9aoaT3IpU068yzu3eGKRdRw8ri76zvcV9wis2AB+5HsgD/fSRvodu57lM/
7LcDt4totobtLGvQqj145ej84BFtfAo=
=KjI9
-----END PGP SIGNATURE-----

--2xLiGAbObogF50Js--

