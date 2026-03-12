Return-Path: <linux-leds+bounces-7312-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEjdBQrIsmmvPAAAu9opvQ
	(envelope-from <linux-leds+bounces-7312-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 12 Mar 2026 15:04:58 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90479273103
	for <lists+linux-leds@lfdr.de>; Thu, 12 Mar 2026 15:04:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 68F74304B382
	for <lists+linux-leds@lfdr.de>; Thu, 12 Mar 2026 14:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25A23283FE5;
	Thu, 12 Mar 2026 14:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jMGT4feG"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C1312B94;
	Thu, 12 Mar 2026 14:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773324035; cv=none; b=e4OBsJ4KnFdI9Zgjms1csp89i1cYxZHyFobZ3G7hQRmTVZUPt93eYF5WJRcQ35rRXbYSCuJlvYuhKMG4PAmHUxxRqZCHeOu6MNQ74721rptnhnj00oh2erTQq9n0Ygq2iZ8g5xCHla3P1i3HdeJP+Ji5leSWcUd8o0xN+JP9DAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773324035; c=relaxed/simple;
	bh=lgzAwmcia1bIMN1GXKk0zq/eE3MT5qXplE1hzEEEs5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=upDUmoxgapZiPhov0P3hXtR2Bre2g/XQ194BD7rVDs00aGqM+jbsp7eqBUS0V75mVdQ5dUaZVNlHGGf7v/QuiRsKC8oSYkzb4wHSkZD+A7RjDwq4xt0/mk0dzv/ER2nBy3Ce2ma8ZP1+uDVpnllvIz10seBRU+RrKFtYUdp+JRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jMGT4feG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52F01C19424;
	Thu, 12 Mar 2026 14:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773324034;
	bh=lgzAwmcia1bIMN1GXKk0zq/eE3MT5qXplE1hzEEEs5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jMGT4feG0qm/dNmC0kI18hsGyvHTMrmIX0kDEHPHWL7UB352oMdTlgIKXYfNNew7/
	 1Xt9zSHmZZ/JnC+6zzuRVbhkrzYhPdlqfoEaP8aISQ3Dxu3RhidELIayZ4HIND+jcx
	 guvMUahvzZmxPvxcjNZLhkMzdwHIWNNrToo0BO0cTp0FaZxPQU3C3AqjsH8UKPdOyQ
	 iA1w7hcVWmk5qorI3J1lBD9Jcjr1AeG/v+NSt+eodGpbQPXf9X285jYMjEzfxteKuy
	 7lKup7ivdS2jWbgw0ZELBGgsTNGUXlxJ5gB5Q6QbQb9qm+VqLX4+I84in/oOUTfV2f
	 fI5xq2q+JgNwA==
Date: Thu, 12 Mar 2026 09:00:32 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-pm@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>,
	devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Ion Agorria <ion@agorria.com>, linux-leds@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
	=?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/7] dt-bindings: embedded-controller: document ASUS
 Transformer EC
Message-ID: <177332403209.2914211.14156950861343429723.robh@kernel.org>
References: <20260304185751.83494-1-clamor95@gmail.com>
 <20260304185751.83494-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304185751.83494-2-clamor95@gmail.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7312-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,agorria.com,gmail.com,rere.qmqm.pl];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 90479273103
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 04 Mar 2026 20:57:45 +0200, Svyatoslav Ryhel wrote:
> Document embedded controller used in ASUS Transformer device series.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../asus,tf201-ec-pad.yaml                    | 119 ++++++++++++++++++
>  1 file changed, 119 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


