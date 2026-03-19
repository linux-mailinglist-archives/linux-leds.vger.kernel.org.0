Return-Path: <linux-leds+bounces-7394-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGlGEEDuu2liqQIAu9opvQ
	(envelope-from <linux-leds+bounces-7394-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 19 Mar 2026 13:38:24 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B206A2CB3BB
	for <lists+linux-leds@lfdr.de>; Thu, 19 Mar 2026 13:38:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8FC043017511
	for <lists+linux-leds@lfdr.de>; Thu, 19 Mar 2026 12:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6011038E10D;
	Thu, 19 Mar 2026 12:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PQv++LIQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E479B3C8718
	for <linux-leds@vger.kernel.org>; Thu, 19 Mar 2026 12:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773923901; cv=none; b=gQUNZoikiAnu5Rp3ynYuIY0QxSeqm6er8flS6kIk11GxXTHi4OwZUj68JmiYs9M9zCkbyOgI9SChb7XgRYw7yhh/n4pFsuDbJCh0a6yPnIqzQpuUqUDINA5LstdJSuhfEkCpfieKBeAHr7vlnJCzLEFZ9ep+L3U+a7qWjURD5tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773923901; c=relaxed/simple;
	bh=H6ZYwaeC+ssXlys6GfUeO2MkiM1tDavOy+eRjetjoUQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OHKO4Sja545MC32c8Oq4Jj2Lal8AwXuVJk4SL4KVAe+xjPKoI+Yyaz5QOXr4Jd+3JUYrqHOcKSUFDZpFlLnN7sSty9kyj7YjiAIkNBcP8SxgnrzH/sNOQ69IaHDag81RRx5qmj6BQJmTAq+VnBqnMpK40nLhtc0dVkGu0b32bMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PQv++LIQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 599D3C2BCB0
	for <linux-leds@vger.kernel.org>; Thu, 19 Mar 2026 12:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773923900;
	bh=H6ZYwaeC+ssXlys6GfUeO2MkiM1tDavOy+eRjetjoUQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PQv++LIQV7bM2V0j2ljWiNNOl6XSFJHs0i+AjIJtIyOFqQx+VfPkpJ7KMib3dmtcS
	 KZE69HABDWdwINUbml0/sbIZdVljBlLK4U1QxcstKW32KaJ8JARmaC/nOWveV4d6Kb
	 QxejeMssXezdK9x4q6NZ9XRIpbKS1O56n0vsdnuq5QObYBmgYTvNNXxegIMS+OoXgI
	 HiVE/Mi6HPHn+eeSYpkgjSEPPSZgz5/Sy8ppdagdtJ8/Upzphpu6P7hk+pHIa/7gO8
	 JvEWLlL5OwZc5WPHqdqXcpKt3vf32unCBEREA7XdV7G/WU9w+XuvrxbFhUsyb9ed8E
	 Nq25yDXvjZ1Ow==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79a7109f568so10025857b3.1
        for <linux-leds@vger.kernel.org>; Thu, 19 Mar 2026 05:38:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXOpiyahVVjp01wkQOOt02ZeFWNiJnIoAWNh4EwuY/9kn8PIi9dFWhBVOvl0cZuq62jzoIsrEm8/SXh@vger.kernel.org
X-Gm-Message-State: AOJu0YxZiG3dgt3Z1Wvb+y86joaAutGUjWJnW3PKRG3hPheMU+k6vHtN
	4I6g72Z3ETq5HmrgTKh2n5afrpm3PbKJJM231oSk6jX0KV/sV82urWSMW3yeqyuQx6pXQuwsX7G
	fTxe97ch5BUP5WPOKxK6BFSKWp+YJQEA=
X-Received: by 2002:a05:690c:c4e8:b0:79a:7d50:fbc5 with SMTP id
 00721157ae682-79a7d50ffe2mr42966847b3.49.1773923899626; Thu, 19 Mar 2026
 05:38:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318-expressatt_camera_flash-v2-0-5c2b9a623dcb@gmail.com> <20260318-expressatt_camera_flash-v2-1-5c2b9a623dcb@gmail.com>
In-Reply-To: <20260318-expressatt_camera_flash-v2-1-5c2b9a623dcb@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Mar 2026 13:38:07 +0100
X-Gmail-Original-Message-ID: <CAD++jLm7=Ae1F5yGZS3zakSPo5n5Xua2ciBqnGukuz1Ece0ZAw@mail.gmail.com>
X-Gm-Features: AaiRm53Z3zQlQa8wtQcwRcXu_BTRQT3SjsYqIajcVpSARHSk8IVLPPh_mouVUHY
Message-ID: <CAD++jLm7=Ae1F5yGZS3zakSPo5n5Xua2ciBqnGukuz1Ece0ZAw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: leds: rt8515: Support single-GPIO
 flash ICs with vin supply
To: guptarud@gmail.com
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-7394-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.973];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: B206A2CB3BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 7:34=E2=80=AFPM Rudraksha Gupta via B4 Relay
<devnull+guptarud.gmail.com@kernel.org> wrote:

> From: Rudraksha Gupta <guptarud@gmail.com>
>
> Some flash ICs use the same one-wire pulse-count protocol as the RT8515
> but have only a single enable line for both flash and torch modes, plus
> an optional input voltage supply (e.g. a GPIO-controlled fixed
> regulator) that gates power to the chip.
>
> Make ent-gpios optional and add a vin-supply property to support these
> variants. Add a oneOf constraint requiring exactly one of ent-gpios or
> vin-supply. Add a binding example showing the single-GPIO configuration
> with an input supply.
>
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>

This looks right to me!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

