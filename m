Return-Path: <linux-leds+bounces-7326-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGNwB3xetGmKmgAAu9opvQ
	(envelope-from <linux-leds+bounces-7326-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 13 Mar 2026 19:59:08 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BD66A28904E
	for <lists+linux-leds@lfdr.de>; Fri, 13 Mar 2026 19:59:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09013316BD9C
	for <lists+linux-leds@lfdr.de>; Fri, 13 Mar 2026 18:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F6B33DEAE5;
	Fri, 13 Mar 2026 18:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rN9GwUbY"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07853DB64F
	for <linux-leds@vger.kernel.org>; Fri, 13 Mar 2026 18:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773428259; cv=none; b=DCA9hDVFZn4QfSkg6iUs66R4zHSXon45TbrjKZ5HXNj/W+JywZ1eEx4qIAQcV43HiCJ/Qm2/nPSdU8kfpcjVdWn3G2e/eCjMMyckjyg5wNbVv8R7zQD57HubArZl3T9fbr4h6Uq2A4Ox8D0wYhq+i0VBD4dpzvMQaMGt1igCD80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773428259; c=relaxed/simple;
	bh=34m2T8zjB+u4MLGHeKznxeFD6ttVQwhK+4XwYx0EGyM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YYjgOrpOz+hRG38cgGI0zgKbLa7KIzPuLv+q5fnbgm7e6DIQIC2Z26N5QJPnl52eUWoZ1Tpe2eNC/XNslS5219qjZ+/MVC490tss3l9ZMsTTP9ZXhVTSx1MmzlV1jg4O+CM3yVVRn8f5+bgr8fP3OwN721TTKp+uCSn4HiSm8Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rN9GwUbY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1760C2BCB8
	for <linux-leds@vger.kernel.org>; Fri, 13 Mar 2026 18:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773428258;
	bh=34m2T8zjB+u4MLGHeKznxeFD6ttVQwhK+4XwYx0EGyM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rN9GwUbYc0LU//yQ7aS5ISpKN7mJwws6vgq4FtnDBrD0ZfmAGZkWuBdrmK88j9RVJ
	 L4PA6Xz/VqnnAgsKs0d4ptSSCWYKdgpyNsYRiZu59dLGZ8GJF71YdkYdnBZlGNgy2t
	 g8mX1QE5P5BjiJ6MMMaky/6/DtTXfC5E9lxRBWsrdyOtymwRis3/5dUCUOcj1xSUBt
	 4UxZY/7KzsPiF0lTE/v9jVrg8fKhRqEp5TgjI87w/xWFaqFZQrv6oggKNidnLbib8T
	 jO8XoFUDfttizxkmPNE+qajMbg3lOIxt/+PHWWVpxD8+7Sk9eBAL28YcOOufezRE0w
	 Um1G5kRYVq14Q==
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-467166cb638so1041498b6e.2
        for <linux-leds@vger.kernel.org>; Fri, 13 Mar 2026 11:57:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVUWW9FEDQ3XM6dLhOhr2VtlSJLZJbsmaDGe4lPU6gCGW3Zcorxd6bwZKYAvNpuoEXZXn/JKI3nmS51@vger.kernel.org
X-Gm-Message-State: AOJu0YyqMJltedCa3SzlWm7d+KvRe5nznLpsyFW3nf5v/AHIIOMwxrRt
	GnwFV4+3v1U9mjJCu7ukjYTrqQFcC+8qI63ZB3mvAXZyj7nErw6Q6hHiCNKKwGk41lUw6E7JxFd
	g3D15LTCmkpzC1b2SQTPE6J/nBGhoWU4=
X-Received: by 2002:a05:6820:c93:b0:67b:bf52:9987 with SMTP id
 006d021491bc7-67bdaa63959mr2561459eaf.60.1773428257476; Fri, 13 Mar 2026
 11:57:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313-synology_microp_initial-v3-0-16941debd8a0@posteo.de> <20260313-synology_microp_initial-v3-3-16941debd8a0@posteo.de>
In-Reply-To: <20260313-synology_microp_initial-v3-3-16941debd8a0@posteo.de>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 13 Mar 2026 19:57:26 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hYcSDKid4cbz8ZVZG+vLSHvzPB2UryevEpE15W1w7G3g@mail.gmail.com>
X-Gm-Features: AaiRm52wIYLXzpbrcPk1yGnN18zABaxFLxVozfWcNMKe7mZAiwm1YS4O-8Hh8h0
Message-ID: <CAJZ5v0hYcSDKid4cbz8ZVZG+vLSHvzPB2UryevEpE15W1w7G3g@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] acpi: add acpi_of_match_device_ids
To: Markus Probst <markus.probst@posteo.de>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Igor Korotin <igor.korotin.linux@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
	Robert Moore <robert.moore@intel.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pci@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-acpi@vger.kernel.org, 
	acpica-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7326-lists,linux-leds=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,collabora.com,intel.com,vger.kernel.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BD66A28904E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 7:48=E2=80=AFPM Markus Probst <markus.probst@posteo=
.de> wrote:
>
> Add a function to match acpi devices against of_device_ids. This will be
> used in the following commit ("mfd: match acpi devices against PRP0001")
> to match mfd sub-devices against a of compatible string.

Not until I can see how this is going to be used.

Maybe never.

> Signed-off-by: Markus Probst <markus.probst@posteo.de>
> ---
>  drivers/acpi/bus.c      | 7 +++++++
>  include/acpi/acpi_bus.h | 2 ++
>  2 files changed, 9 insertions(+)
>
> diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
> index f6707325f582..5ddcc56edc87 100644
> --- a/drivers/acpi/bus.c
> +++ b/drivers/acpi/bus.c
> @@ -1044,6 +1044,13 @@ int acpi_match_device_ids(struct acpi_device *devi=
ce,
>  }
>  EXPORT_SYMBOL(acpi_match_device_ids);
>
> +int acpi_of_match_device_ids(struct acpi_device *device,
> +                         const struct of_device_id *ids)
> +{
> +       return __acpi_match_device(device, NULL, ids, NULL, NULL) ? 0 : -=
ENOENT;
> +}
> +EXPORT_SYMBOL(acpi_of_match_device_ids);
> +
>  bool acpi_driver_match_device(struct device *dev,
>                               const struct device_driver *drv)
>  {
> diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
> index aad1a95e6863..0081b9e4aaee 100644
> --- a/include/acpi/acpi_bus.h
> +++ b/include/acpi/acpi_bus.h
> @@ -677,6 +677,8 @@ void acpi_bus_trim(struct acpi_device *start);
>  acpi_status acpi_bus_get_ejd(acpi_handle handle, acpi_handle * ejd);
>  int acpi_match_device_ids(struct acpi_device *device,
>                           const struct acpi_device_id *ids);
> +int acpi_of_match_device_ids(struct acpi_device *device,
> +                         const struct of_device_id *ids);
>  void acpi_set_modalias(struct acpi_device *adev, const char *default_id,
>                        char *modalias, size_t len);
>
>
> --
> 2.52.0
>
>

