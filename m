Return-Path: <linux-leds+bounces-7440-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCANMlqbwWlNUAQAu9opvQ
	(envelope-from <linux-leds+bounces-7440-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 20:58:18 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE4A2FCB83
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 20:58:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 90B58302492E
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 19:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB61B3612F1;
	Mon, 23 Mar 2026 19:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QfVe6v9Z"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76CA3E023C
	for <linux-leds@vger.kernel.org>; Mon, 23 Mar 2026 19:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774295892; cv=none; b=WtISC+lx/UffAssI8nl+PK20DQrZ/8OTL8chzGri2NKD48F+ohR09tIHGFWziyg0sKae6Cdzxb3jXoj53LLz23iazEzcpimWeDHmE1o5+IusMfArs2lS+1AG81JV94FCw2BLvvdYWdbJpIBeLC3yEkWXMqVj8Hi4R7aFvfdsPKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774295892; c=relaxed/simple;
	bh=1WuhV/zGG8Mj+XqPD5jDsD1mKnzd5UrbX2zgBBrEQvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EAUcd37yVpzk/MmqaQIZpOM8pjdIjcK+DVw6JckeI/649ft046xS4iQyrC0z2wMOcfRtSDuHCGyXNEqn36Yw/h8G5kQisqe4PkoBbJ4u9AM6g3ZpWaBMh3emqFe7v4pH5enBZZSuJ5BDykPVJcke896QfIPDDIJm46aJNzB63tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QfVe6v9Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D1C2C2BC9E
	for <linux-leds@vger.kernel.org>; Mon, 23 Mar 2026 19:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774295892;
	bh=1WuhV/zGG8Mj+XqPD5jDsD1mKnzd5UrbX2zgBBrEQvc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QfVe6v9ZW5EgH/2RuG4ZeptJY7YZc/0vN40GkNAV5VqN6d/HU4FTbxuypV10DmlFi
	 TKeTNd7OBYxwvpCJLzejjeoojv6igh4n/Kjgaals31IFVNxLIz7JlVr4Zu+p3aQZBH
	 x3UXDtzMeQs85CZ3/v7Va0PFSFYHVNFfZP/Ss3Wg9YAIeVMYSj5B5eDpf/U/nGvxMb
	 6mWEMiOpLpqlAqcIFsQDsqLxTAoFUF1wC61qs6IqpeCzBubM+CuOZEuAldOeUCcV9C
	 TXFirs0abfteKF5/y9JRbs1IyQKd9d6MpG+vkQTFZP6Fl7bBK0dyjf8Oj292JbmTYF
	 KPE25m03GnSqg==
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-41708f6c3feso319505fac.3
        for <linux-leds@vger.kernel.org>; Mon, 23 Mar 2026 12:58:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW/pzN5rtPn3yQz8CVR/NDeeYtEoGqbNFBioAin1dsQMDmWBoAj0fvewdrPaHjno0E5ZLFfCx/7GcdV@vger.kernel.org
X-Gm-Message-State: AOJu0YxTMARirfySTUF2UXN9L7krv4+WYx9XhNuqMtJYJ4WzU9hCXm00
	OGRdE/fYb2PnuujNoVnSb5AVkSCOFvgntJyJtgxrMmBXoAku/VHVDU0Q7Nvp/gzoc3lsAPz4yQG
	7PFJWHad+VVrtPgfA5xaC1bfbxRidWtM=
X-Received: by 2002:a05:6870:b020:b0:417:49da:7ff8 with SMTP id
 586e51a60fabf-41c111dfd24mr8482761fac.34.1774295891119; Mon, 23 Mar 2026
 12:58:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313-synology_microp_initial-v3-0-ad6ac463a201@posteo.de> <20260313-synology_microp_initial-v3-3-ad6ac463a201@posteo.de>
In-Reply-To: <20260313-synology_microp_initial-v3-3-ad6ac463a201@posteo.de>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 23 Mar 2026 20:57:59 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jxHO2EH5NeEsMkxGz5xqVL00tO-W1JpaVd=GhwgQ3T=A@mail.gmail.com>
X-Gm-Features: AaiRm50DmGsYCjXug2Jt79bfM7j5ojMYqMa_-0d7Zxr4c3dbQEoSRohbKGvtDu8
Message-ID: <CAJZ5v0jxHO2EH5NeEsMkxGz5xqVL00tO-W1JpaVd=GhwgQ3T=A@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] acpi: add acpi_of_match_device_ids
To: markus.probst@posteo.de
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7440-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,posteo.de:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 6DE4A2FCB83
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 8:03=E2=80=AFPM Markus Probst via B4 Relay
<devnull+markus.probst.posteo.de@kernel.org> wrote:
>
> From: Markus Probst <markus.probst@posteo.de>
>
> Add a function to match acpi devices against of_device_ids. This will be
> used in the following commit ("mfd: match acpi devices against PRP0001")
> to match mfd sub-devices against a of compatible string.

Please always spell ACPI in capitals in patch subjects, comments,
changelogs, etc.  It is not a regular word.

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

Missing kerneldoc.

> +int acpi_of_match_device_ids(struct acpi_device *device,
> +                         const struct of_device_id *ids)
> +{
> +       return __acpi_match_device(device, NULL, ids, NULL, NULL) ? 0 : -=
ENOENT;
> +}
> +EXPORT_SYMBOL(acpi_of_match_device_ids);

Are you aware of the consensus that using PRP0001 in production
platform firmware will be regarded as invalid?

Because of that, it is not an option for a driver to avoid providing
ACPI match data on a platform that uses ACPI.

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

