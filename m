Return-Path: <linux-leds+bounces-7581-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOW0JK0fymmu5QUAu9opvQ
	(envelope-from <linux-leds+bounces-7581-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 30 Mar 2026 09:01:01 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C907535629A
	for <lists+linux-leds@lfdr.de>; Mon, 30 Mar 2026 09:01:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 990BA3005167
	for <lists+linux-leds@lfdr.de>; Mon, 30 Mar 2026 07:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60C9039DBF5;
	Mon, 30 Mar 2026 07:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z0q3iRdy"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3608C396B67;
	Mon, 30 Mar 2026 07:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774854058; cv=none; b=J7/PuNGuU64EIK4YQEqJnKjl5EfAuKdB0pU0PALw1HwpTHLEGC6n0Wx1kt4TX/RtIyw8Mo83YvZilNvGzLPEhbKqXTubpsULuTvNhOPH+kHelARvDuDcrN98u5gQMh0Af9L2pn/SWNTuCtSa+z455tmpQxF1IxuQ1YP9Ve3qyOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774854058; c=relaxed/simple;
	bh=mpLOTBgcJ+N7b+UIifAjqsoIn/hOwhyWRvmgg2BU6wY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uPgVATWYtL7hovv+rVOjiqmFBO02bP9dzd8ntEPODcycNYJsYfEaI/Xsi0J7ktvqR0tFg9W/dEdMh8PaE70EbUh+88/QxG/b+DgqaO+D0I1yI5lmC8y2Uu3h02MSWYD6wExoI6M/bHt8atblyVkAWGxWSjLBHqKsCOLoRpmZEU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z0q3iRdy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D750C4CEF7;
	Mon, 30 Mar 2026 07:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774854057;
	bh=mpLOTBgcJ+N7b+UIifAjqsoIn/hOwhyWRvmgg2BU6wY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z0q3iRdy9HNTVbA1TKjvlvvWrLuSO5tBNBzWVN7vio5tw6V3z190myQ4W1qgOYkNw
	 xxxOo0fe7KpcGuxxhZCkWQ7bhq81WmH6QDmuqGQGXDWHMJpD79jzAkaCzfxFr+J7e7
	 +QAio3nRrLx5r7VirmUNUSIZa1O2WD6Jy775VJ/4V8P/W7M1nrY45s3qequMTnQHfq
	 bLyWvoJpGE4DB+QdiXoEbX3pidKG1/4XqOUwi+vkHTpFA3skvFyoKbCwJmqnrxEAsE
	 gQxQOM6SGx7PkK9lvjO9TBNWVeF4VlmUr+br/63cTy7oucTj9QMNtvgCNRbaIaecPh
	 /RpLcrsPmhjsg==
Date: Mon, 30 Mar 2026 09:00:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Markus Probst <markus.probst@posteo.de>
Cc: Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Len Brown <lenb@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v5 2/4] ACPI: of: match PRP0001 in of_match_device
Message-ID: <20260330-bipedal-invaluable-slug-0c6dea@quoll>
References: <20260329-synology_microp_initial-v5-0-27cb80bdf591@posteo.de>
 <20260329-synology_microp_initial-v5-2-27cb80bdf591@posteo.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260329-synology_microp_initial-v5-2-27cb80bdf591@posteo.de>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7581-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linaro.org,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C907535629A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 29, 2026 at 08:02:16PM +0200, Markus Probst wrote:
> Export `acpi_of_match_device` function and use it to match for PRP0001
> in `of_match_device`, if the device does not have a device node.
> 
> This fixes the match data being NULL when using ACPI PRP0001, even though
> the device was matched against an of device table.

Fixes tag?

I don't see how this is going to fix !ACPI case - the
acpi_of_match_device() will just return false.


> 
> Signed-off-by: Markus Probst <markus.probst@posteo.de>
> ---
>  drivers/acpi/bus.c   |  7 ++++---
>  drivers/of/device.c  |  9 +++++++--
>  include/linux/acpi.h | 11 +++++++++++
>  3 files changed, 22 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
> index 2ec095e2009e..cd02f04cf685 100644
> --- a/drivers/acpi/bus.c
> +++ b/drivers/acpi/bus.c
> @@ -831,9 +831,9 @@ const struct acpi_device *acpi_companion_match(const struct device *dev)
>   * identifiers and a _DSD object with the "compatible" property, use that
>   * property to match against the given list of identifiers.
>   */
> -static bool acpi_of_match_device(const struct acpi_device *adev,
> -				 const struct of_device_id *of_match_table,
> -				 const struct of_device_id **of_id)
> +bool acpi_of_match_device(const struct acpi_device *adev,
> +			  const struct of_device_id *of_match_table,
> +			  const struct of_device_id **of_id)
>  {
>  	const union acpi_object *of_compatible, *obj;
>  	int i, nval;
> @@ -866,6 +866,7 @@ static bool acpi_of_match_device(const struct acpi_device *adev,
>  
>  	return false;
>  }
> +EXPORT_SYMBOL_GPL(acpi_of_match_device);
>  
>  static bool acpi_of_modalias(struct acpi_device *adev,
>  			     char *modalias, size_t len)
> diff --git a/drivers/of/device.c b/drivers/of/device.c
> index f7e75e527667..128682390058 100644
> --- a/drivers/of/device.c
> +++ b/drivers/of/device.c
> @@ -11,6 +11,7 @@
>  #include <linux/mod_devicetable.h>
>  #include <linux/slab.h>
>  #include <linux/platform_device.h>
> +#include <linux/acpi.h>
>  
>  #include <asm/errno.h>
>  #include "of_private.h"
> @@ -26,8 +27,12 @@
>  const struct of_device_id *of_match_device(const struct of_device_id *matches,
>  					   const struct device *dev)
>  {
> -	if (!matches || !dev->of_node || dev->of_node_reused)
> -		return NULL;
> +	if (!matches || !dev->of_node || dev->of_node_reused) {
> +		const struct of_device_id *id = NULL;
> +
> +		acpi_of_match_device(ACPI_COMPANION(dev), matches, &id);

I don't think this should be done from of_match_device. Yuo will have
soon recursive calls, because acpi_of_match_device() will call other
match, that will call of_match_device() and so on...

of_match_device() is supposed to match only against OF. Not ACPI. There
should be no ACPI header or code in this unit file.

Best regards,
Krzysztof


