Return-Path: <linux-leds+bounces-7839-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGxlJqFg62kCMAAAu9opvQ
	(envelope-from <linux-leds+bounces-7839-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 24 Apr 2026 14:22:57 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF55445E5CF
	for <lists+linux-leds@lfdr.de>; Fri, 24 Apr 2026 14:22:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F4BF300F9CD
	for <lists+linux-leds@lfdr.de>; Fri, 24 Apr 2026 12:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBD463CA49E;
	Fri, 24 Apr 2026 12:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="rlpAGBkX"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DE63C5DC5
	for <linux-leds@vger.kernel.org>; Fri, 24 Apr 2026 12:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777033364; cv=none; b=Uz9U/1eXc8GU0Y4+XuonUXL9Tk63oI9QOrqg/AYxWpwfaJPQtmkx2WK1bCFcdyrtKFpjK9dYSlWtT/y+WEatRCdyIQlWRSaXrT3qC6rrSzAC2f4ptLq1sy3lavcudZnxqXbVHmXnCG0a6CaPqoomII/43+YllcrM8yMpa5Go0wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777033364; c=relaxed/simple;
	bh=wJW9kcgPJ2DpqKlWhRWAZ0QMmLQUceL6zf+x2xRjrNg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pso/j1H0JZD90ZMOW9kh7aWzxaswF0YQevoFtBC1N4BV0Fz7aqR3KkasBBnJh4n+I0bZ42JmDI/MXmOq94A1jbx5O3dXGVf81wMSz5dkeNJSuA0QANO50rQh+I4+JvOEhJ6+0I6rRMSC6Nywq+4d6OhuglsLAGcndBUslYXVUo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=rlpAGBkX; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id E866A240107
	for <linux-leds@vger.kernel.org>; Fri, 24 Apr 2026 14:22:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1777033358; bh=p/6HG/azrY+ZcC6JeHbq+1FB75imiSA1zA2tnWoXkrY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:To:Cc:Autocrypt:OpenPGP:From;
	b=rlpAGBkXTDjGeQNQCLEhKGhBY3BagUOpABgFD672SRrxC93NPjuShRsOoYWDdS0KO
	 G+fqbdpesaf5TUgRUVsqHJ6/kAQy/gmGHLdriup37gY8ofmd3A/7KgPaVf443Wl5mu
	 PaWKYww+y7KqLvhthqmOt5onQqM0gN13QfHFct2mtSNyuIdtaO+M2KRfbpU9oYc6uR
	 8riUEfDQgHGdxAW8ApSnwti18FVpEIjf51jvpO0PUH3EVj0/+CxZ3yxEnZeZbLJ6JA
	 VEmrpxjRUx1TUGSq65m9r/TjNNzoknttRFc3WFhIznXSvhu+61JB1eB86ZRagdEU/8
	 /JtXoxbuDGj9w==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4g2BtL66Wtz9rxQ;
	Fri, 24 Apr 2026 14:22:34 +0200 (CEST)
From: Markus Probst <markus.probst@posteo.de>
Subject: [PATCH v10 0/2] Introduce Synology Microp driver
Date: Fri, 24 Apr 2026 12:22:38 +0000
Message-Id: <20260424-synology_microp_initial-v10-0-e852d2f3eba1@posteo.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF1g62kC/4XR22rDMAwG4FcpuZ6LD/IpV3uPMYpjy5uhbbo4D
 Sul7z63HdSkZLuUQJ9/yecm45AwN+3q3Aw4pZz6fSkYfVk1/tPtP5CkUBoNp1xRQRXJp32/7T9
 Om13yQ3/YpH0ak9sSGnVwXncarGrK9GHAmL5v9Nv7vR7w61heGO/Nh9+uii4ZZ5oMxzxuSqaAE
 0GUYBhaaqRvJ9nUkX5HGIP7yBZDJs5KG7XnUUfbTkxcJzqXkfh+t0tju5r0mjbXMJ8pj/1wuq0
 9sVuafxecGKEk+hgxoAIw/vXQ5xH7dcCbOfHaMcsOL44VxlolomBezh1ROUwsO6I4LijnQQnHK
 Zs7UDmcLjtQHApchNAZ4R3MHVk7dtmRxeHad4Z2IUr7lEc9HKBy2VHXPCYGBA2d8nbu6MphbNn
 R1zs74agF1OVEc8dUzl/3McXRFpSzjAM872Vr54//ssUBZ6QQ0WikunYul8sPmLq9mIwDAAA=
X-Change-ID: 20260306-synology_microp_initial-0f7dac7b7496
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Markus Probst <markus.probst@posteo.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=5727;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=wJW9kcgPJ2DpqKlWhRWAZ0QMmLQUceL6zf+x2xRjrNg=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBp62CKLKegxmkNNgJZk2HS6nAii08ucQqyu4hsF
 +YsBTCeLRKJAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCaetgihsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQNHYf+OetQ9L+hQ/9GwR7OBsG89r92ig5DBqse3vE8itOlps
 R5RS2GS69uICskHzZaRjb060NLhgGEBCVXe7OWr3MTbaHtnpNmCawroFEeEfp+ZYbPBWZZlpkSB
 BUK6ZTWkkavWk5gma2GMYR1rCCJemDLoxXXzd6A3ahd7R+ArRpydlLQIjkMpWGJeXVpZAaB8Zgk
 OIfSuifMdVgyS+/r4sqHjun2hxfwYXcIhHggtazeolUt5Z9ici26oebRtULOMTwysWLGj5PqO4c
 +bH4wSnP1NJulGcE3aSq+lWVbvY5YI84eeHKCAhGwC10fF7y/pBfJls+DyMPVaxs9HoBtAF9Z4V
 jSmFLuj+5ULXcynjlj3rVkjsukIOSV1zUi9HlQI9jmrps1SEhi0XCHumhvEeH1aeptG+xPrzI9G
 AEgtuGz4jy21i0tfyz8pajnDpj6F/EHoSG48EAwpiIJi6gePU7we0piNWNhtC+xDc+hoem9nxAi
 qZoWDCid2YoK20szi6hANXPD1pv2jn732TUHx3VW0wLAK2HblBJxuWEUYDuKICa/eqK3MkPdhvu
 HDsSiIxxXUwStNaSGn2RNE4fdT0KaGHqET/9CGe/h6n7csQr0V/HAVIW5gXjpiFrBz8I+huRcuz
 amXwXLGkFH2mDZAGAeiC0Yso2jme6aERFYPNaYKKZFXO319Eijng=
X-Developer-Key: i=markus.probst@posteo.de; a=openpgp;
 fpr=827418C4F4AC58E77230C47334761FF8E7AD43D2
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
  keydata=xsFNBGiDvXgBEADAXUceKafpl46S35UmDh2wRvvx+UfZbcTjeQOlSwKP7YVJ4JOZrVs93qReNLkO
  WguIqPBxR9blQ4nyYrqSCV+MMw/3ifyXIm6Pw2YRUDg+WTEOjTixRCoWDgUj1nOsvJ9tVAm76Ww+
  /pAnepVRafMID0rqEfD9oGv1YrfpeFJhyE2zUw3SyyNLIKWD6QeLRhKQRbSnsXhGLFBXCqt9k5JA
  RhgQof9zvztcCVlT5KVvuyfC4H+HzeGmu9201BVyihJwKdcKPq+n/aY5FUVxNTgtI9f8wIbmfAja
  oT1pjXSp+dszakA98fhONM98pOq723o/1ZGMZukyXFfsDGtA3BB79HoopHKujLGWAGskzClwTjRQ
  xBqxh/U/lL1pc+0xPWikTNCmtziCOvv0KA0arDOMQlyFvImzX6oGVgE4ksKQYbMZ3Ikw6L1Rv1J+
  FvN0aNwOKgL2ztBRYscUGcQvA0Zo1fGCAn/BLEJvQYShWKeKqjyncVGoXFsz2AcuFKe1pwETSsN6
  OZncjy32e4ktgs07cWBfx0v62b8md36jau+B6RVnnodaA8++oXl3FRwiEW8XfXWIjy4umIv93tb8
  8ekYsfOfWkTSewZYXGoqe4RtK80ulMHb/dh2FZQIFyRdN4HOmB4FYO5sEYFr9YjHLmDkrUgNodJC
  XCeMe4BO4iaxUQARAQABzRdtYXJrdXMucHJvYnN0QHBvc3Rlby5kZcLBkQQTAQgAOxYhBIJ0GMT0
  rFjncjDEczR2H/jnrUPSBQJog714AhsDBQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheAAAoJEDR2
  H/jnrUPSgdkQAISaTk2D345ehXEkn5z2yUEjaVjHIE7ziqRaOgn/QanCgeTUinIv6L6QXUFvvIfH
  1OLPwQ1hfvEg9NnNLyFezWSy6jvoVBTIPqicD/r3FkithnQ1IDkdSjrarPMxJkvuh3l7XZHo49GV
  HQ8i5zh5w4YISrcEtE99lJisvni2Jqx7we5tey9voQFDyM8jxlSWv3pmoUTCtBkX/eKHJXosgsuS
  B4TGDCVPOjla/emI5c9MhMG7O4WEEmoSdPbmraPw66YZD6uLyhV4DPHbiDWRzXWnClHSyjB9rky9
  lausFxogvu4l9H+KDsXIadNDWdLdu1/enS/wDd9zh5S78rY2jeXaG4mnf4seEKamZ7KQ6FIHrcyP
  ezdDzssPQcTQcGRMQzCn6wP3tlGk7rsfmyHMlFqdRoNNv+ZER/OkmZFPW655zRfbMi0vtrqK2Awm
  9ggobb1oktfd9PPNXMUY+DNVlgR2G7jLnenSoQausLUm0pHoNE8TWFv851Y6SOYnvn488sP1Tki5
  F3rKwclawQFHUXTCQw+QSh9ay8xgnNZfH+u9NY7w3gPoeKBOAFcBc2BtzcgekeWS8qgEmm2/oNFV
  G0ivPQbRx8FjRKbuF7g3YhgNZZ0ac8FneuUtJ2PkSIFTZhaAiC0utvxk0ndmWFiW4acEkMZGrLaM
  L2zWNjrqwsD2zsFNBGiDvXgBEADCXQy1n7wjRxG12DOVADawjghKcG+5LtEf31WftHKLFbp/HArj
  BhkT6mj+CCI1ClqY+FYU5CK/s0ScMfLxRGLZ0Ktzawb78vOgBVFT3yB1yWBTewsAXdqNqRooaUNo
  8cG/NNJLjhccH/7PO/FWX5qftOVUJ/AIsAhKQJ18Tc8Ik73v427EDxuKb9mTAnYQFA3Ev3hAiVbO
  6Rv39amVOfJ8sqwiSUGidj2Fctg2aB5JbeMln0KCUbTD1LhEFepeKypfofAXQbGwaCjAhmkWy/q3
  IT1mUrPxOngbxdRoOx1tGUC0HCMUW1sFaJgQPMmDcR0JGPOpgsKnitsSnN7ShcCr1buel7vLnUMD
  +TAZ5opdoF6HjAvAnBQaijtK6minkrM0seNXnCg0KkV8xhMNa6zCs1rq4GgjNLJue2EmuyHooHA4
  7JMoLVHcxVeuNTp6K2+XRx0Pk4e2Lj8IVy9yEYyrywEOC5XRW37KJjsiOAsumi1rkvM7QREWgUDe
  Xs0+RpxI3QrrANh71fLMRo7LKRF3Gvw13NVCCC9ea20P4PwhgWKStkwO2NO+YJsAoS1QycMi/vKu
  0EHhknYXamaSV50oZzHKmX56vEeJHTcngrM8R1SwJCYopCx9gkz90bTVYlitJa5hloWTYeMD7FNj
  Y6jfVSzgM/K4gMgUNDW/PPGeMwARAQABwsF2BBgBCAAgFiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IF
  AmiDvXgCGwwACgkQNHYf+OetQ9LHDBAAhk+ab8+WrbS/b1/gYW3q1KDiXU719nCtfkUVXKidW5Ec
  Idlr5HGt8ilLoxSWT2Zi368iHCXS0WenGgPwlv8ifvB7TOZiiTDZROZkXjEBmU4nYjJ7GymawpWv
  oQwjMsPuq6ysbzWtOZ7eILx7cI0FjQeJ/Q2baRJub0uAZNwBOxCkAS6lpk5Fntd2u8CWmDQo4SYp
  xeuQ+pwkp0yEP30RhN2BO2DXiBEGSZSYh+ioGbCHQPIV3iVj0h6lcCPOqopZqyeCfigeacBI0nvN
  jHWz/spzF3+4OS+3RJvoHtAQmProxyGib8iVsTxgZO3UUi4TSODeEt0i0kHSPY4sCciOyXfAyYoD
  DFqhRjOEwBBxhr+scU4C1T2AflozvDwq3VSONjrKJUkhd8+WsdXxMdPFgBQuiKKwUy11mz6KQfcR
  wmDehF3UaUoxa+YIhWPbKmycxuX/D8SvnqavzAeAL1OcRbEI/HsoroVlEFbBRNBZLJUlnTPs8ZcU
  4+8rq5YX1GUrJL3jf6SAfSgO7UdkEET3PdcKFYtS+ruV1Cp5V0q4kCfI5jk25iiz8grM2wOzVSsc
  l1mEkhiEPH87HP0whhb544iioSnumd3HJKL7dzhRegsMizatupp8D65A2JziW0WKopa1iw9fti3A
  aBeNN4ijKZchBXHPgVx+YtWRHfcm4l8=
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt
X-Rspamd-Queue-Id: EF55445E5CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[posteo.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7839-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[posteo.de:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,linaro.org,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.probst@posteo.de,linux-leds@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]

Synology uses a microcontroller in their NAS devices connected to a
serial port to control certain LEDs, fan speeds, a beeper, to handle
proper shutdown and restart, buttons and fan failures.

This patch series depends on the rust led abstraction [1] and the rust
serdev abstraction [2].

This is only a initial version of the driver able to control LEDs.
The following rust abstractions would be required, to implement the
remaining features:
- hwmon (include/linux/hwmon.h)
- input (include/linux/input.h)
- sysoff handler + hardware protection shutdown (include/linux/reboot.h)

[1] https://lore.kernel.org/rust-for-linux/20260329-rust_leds-v13-0-21a599c5b2d1@posteo.de/
[2] https://lore.kernel.org/rust-for-linux/20260420-rust_serdev-v5-0-57e8ba0519f3@posteo.de/

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
Changes in v10:
- resolved issues reported by Sashiko Bot:
  - removed unneeded include from device tree
  - fix typo in of device table
  - fix blink not set to false, if delay_off or delay_on is 0
- Link to v9: https://patch.msgid.link/20260423-synology_microp_initial-v9-0-4a8533f87e07@posteo.de

Changes in v9:
- separate fallback and front compatibles in dt schema
- remove front compatibles from of id table, if all functionality is
  by covered by the fallback
- remove TODO file
- add platform-driver-x86@vger.kernel.org to Maintainers file entry
- use `Delta` type in `BLINK_DELAY` const
- Link to v8: https://patch.msgid.link/20260420-synology_microp_initial-v8-0-7946a9124491@posteo.de

Changes in v8:
- removed unnecessary Copy and Clone derive
- added `BLINK_DELAY` constant
- added compatible id fallbacks
- moved dt schema patch before the driver
- added ds411p
- Link to v7: https://lore.kernel.org/r/20260411-synology_microp_initial-v7-0-9a3a094e763a@posteo.de

Changes in v7:
- remove list of compatible ids from commit msg
- explain what makes the different models not compatible in the commit msg
- remove unnecessary examples
- Link to v6: https://lore.kernel.org/r/20260405-synology_microp_initial-v6-0-08fde474b6c9@posteo.de

Changes in v6:
- moved devicetree bindings patch at the end of the set
- remove several patches
- move of id table from model.rs to synology_microp.rs
- remove the model! macro
- use if blocks in devicetree schema to narrow down the
  fan-failure-gpios property
- add multiple devicetree examples to test if blocks
- Link to v5: https://lore.kernel.org/r/20260329-synology_microp_initial-v5-0-27cb80bdf591@posteo.de

Changes in v5:
- add esata led support
- use different compatible for each model
- add visibility modifier to of_device_table macro
- fix match data missing when using PRP0001
- Link to v4: https://lore.kernel.org/r/20260320-synology_microp_initial-v4-0-0423ddb83ca4@posteo.de

Changes in v4:
- convert to monolithic driver and moved it into drivers/platform
- removed mfd rust abstraction
- moved dt-bindings to embedded-controller
- Link to v3: https://lore.kernel.org/r/20260313-synology_microp_initial-v3-0-ad6ac463a201@posteo.de

Changes in v3:
- remove `default n` from Kconfig entry, as n is the default already.
- select RUST_SERIAL_DEV_BUS_ABSTRACTIONS in Kconfig
- add mfd rust abstraction
- split core and led parts into their own driver. It should now be considered a
  MFD device.
- split led part of dt binding into its own file
- Link to v2: https://lore.kernel.org/r/20260308-synology_microp_initial-v2-0-9389963f31c5@posteo.de

Changes in v2:
- fix missing tabs in MAINTAINERS file
- remove word binding from patch subject
- add missing signed-off-by
- add missing help entry in Kconfig
- add missing spdx license headers
- remove no-check{,-cpu}-fan properties from the dt-bindings and replace
  them with the check_fan module parameter
- use patternProperties for leds in dt-bindings
- license dt-binding as GPL-2.0-only OR BSD-2-Clause
- move driver from staging tree into mfd tree and mark it as work in
  progress inside Kconfig
- only register alert and usb led if fwnode is present
- Link to v1: https://lore.kernel.org/r/20260306-synology_microp_initial-v1-0-fcffede6448c@posteo.de

---
Markus Probst (2):
      dt-bindings: embedded-controller: Add synology microp devices
      platform: Add initial synology microp driver

 .../synology,ds918p-microp.yaml                    | 100 +++++++
 MAINTAINERS                                        |   7 +
 drivers/platform/Kconfig                           |   2 +
 drivers/platform/Makefile                          |   1 +
 drivers/platform/synology_microp/Kconfig           |  13 +
 drivers/platform/synology_microp/Makefile          |   3 +
 drivers/platform/synology_microp/command.rs        |  54 ++++
 drivers/platform/synology_microp/led.rs            | 286 +++++++++++++++++++++
 drivers/platform/synology_microp/model.rs          |  49 ++++
 .../platform/synology_microp/synology_microp.rs    |  90 +++++++
 10 files changed, 605 insertions(+)
---
base-commit: 3131ff5a117498bb4b9db3a238bb311cbf8383ce
change-id: 20260306-synology_microp_initial-0f7dac7b7496
prerequisite-change-id: 20251217-rust_serdev-ee5481e9085c:v5
prerequisite-patch-id: 52b17274481cc770c257d8f95335293eca32a2c5
prerequisite-patch-id: eec47e5051640d08bcd34a9670b98804449cad52
prerequisite-patch-id: 764976150be0936469334e0f4ab631e994a262a6
prerequisite-patch-id: d0686cf451ef899a06d468adfba51ccd84e6ff98
prerequisite-change-id: 20251114-rust_leds-a959f7c2f7f9:v13
prerequisite-patch-id: 818700f22dcb9676157c985f82762d7c607b861e
prerequisite-patch-id: b15ffa7d95d9260151bfb116b259c4473f721c82
prerequisite-patch-id: 8c47e0d107530f577a1be0b79f8ee791f95d3cbe


