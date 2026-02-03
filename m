Return-Path: <linux-leds+bounces-6823-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDENJ1rVgWkCKgMAu9opvQ
	(envelope-from <linux-leds+bounces-6823-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 03 Feb 2026 12:00:42 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBE3D8054
	for <lists+linux-leds@lfdr.de>; Tue, 03 Feb 2026 12:00:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A1FE30829BD
	for <lists+linux-leds@lfdr.de>; Tue,  3 Feb 2026 11:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B28932D7F1;
	Tue,  3 Feb 2026 11:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bBRpzMFW"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AC032C326
	for <linux-leds@vger.kernel.org>; Tue,  3 Feb 2026 11:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770116431; cv=none; b=E/oZY0jkOKAn5U6vTE/gVAEOolSxbBtJktI02uizfcamKobf0EtQMA9sJ2DRkK1RvM1psrsn0k9cVowtRDofoHPjInF03A2vp01G0nqbzxCaBNsRf3Z32kKdsPW6K1eles3qauen/waToyYfNudr+PoeQxuvRz4jwRJVJKg7j/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770116431; c=relaxed/simple;
	bh=hudPfaB5Y8u+39+QhqcnbqU4DSfvZiJpkZwi23yNzcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tfHRW5JvFLMu1aWnv9DdExZZL+SlYY+1GfZyNU35MKfCq5x6rd7AsVqCdSVQ8l/KYUyXqix6WtAxujNPzCzSX71ZyhYaFuSTVDj+E+pA3kSW1zeUyvRxYvvSzuOFv/zWWCoqqdRYrtK0zt4wGYysRAwG0TWQZeThk1G1nLfTQ1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bBRpzMFW; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2b714f30461so4731957eec.0
        for <linux-leds@vger.kernel.org>; Tue, 03 Feb 2026 03:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770116428; x=1770721228; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0JgnMsXOh9YRopf/e3+gz8PgFtk2UitVTNFeIUt3zTk=;
        b=bBRpzMFWc8IrJor0xe+IV8RxvGmwWg2IpM+53bbVASZd4OkxSngWIl2MFsLiOonJoJ
         xcJZQcwaXuyOVM4fqJxUwBvA18HTc/8qpo8MKA3ce1MrHwEBbmkQoyrVPTW16jNpRso6
         ntlLX8WJ3qOMSVmTJKjPs91RM0TI6BRM7U/fR84Mj4wF7q6LHua4cLe3cNcBSOj692a8
         oZjPP5rPdXcjhmS+qCQchB4Yp60mtm4DX6JoAeaiaMUGA4x3dxt3nxItVVc7orX6nLju
         8FIWXxyczFTl+olaraL90nsYdL3tT4xxoCsNtlgv3m7FkABGH/qxnK9B86rwKq1lsEh5
         07dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770116428; x=1770721228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0JgnMsXOh9YRopf/e3+gz8PgFtk2UitVTNFeIUt3zTk=;
        b=jVKRFptbswPk+3c9xLy33i72e8Nu+HgwzBSMW7B6lFFL33RzHOUxfGXvNQ9K+RNvK6
         A8r7UJKhxDFQUnjL5/bHYYuqpAmEhl+S4eu3PIH4PAKXm6FVgYmBIWVgGH6LPA+Xkxa/
         0HAbMy1SHV74HUeWibJYC1k8TKJzFUqLJjvZtmOWNSEvTNXDWPDmbYPDB1nis4klqPpg
         nrEJHCAooh+ovFPR8iepc/RfmZImj6Wss1RXTMHwiRwVaSm7YZQNwIRCRLCP0lxxYeO/
         EdiLUSMVN5DK8DvdwUvtSOHWmwObjzqWacT74ARj9VwKCXkkk36fCgyLwsKKfivLfkOT
         DWRg==
X-Forwarded-Encrypted: i=1; AJvYcCUn1hhfic1kpQPzST7juym82gSHxgsJtGslU9W6bIZUEWxcv+NusuFxsWrSJdbvBndRC2cB8OrLPHJC@vger.kernel.org
X-Gm-Message-State: AOJu0YxbXnyIoKctARK2gunMlJD6Qv16p6/4/0pDhBo5tDFwP9OlJmQb
	Y/5vkm4jHV5FRHhn8/fA2Ued7MmnTorYi7FgG+Jez440Bn6CV7Xk5tfA
X-Gm-Gg: AZuq6aIlw7r2Ka75IBpMqXcAlStL6NjP6zCJWJTE3GlzsDtuAzHiwDIUVBz8Di0IGqM
	rvUrKzKGZVUm1NxOADqOQe+C3zQefDVYeKY6F08VpaFqY3EL0D5h6Nqpc5ehKM4EfUjshtwb1sz
	dBptrZnoB3/+Rg63ElS0fnAS01qQwUxdCWX6rgqUVl42h+JSaZookeMlDmN8HGE757vrjDU5XVx
	fM/ff4AqBvDKodKbmqhAY0vquc+/v6Z7Yeimkzd7A1Ly4uUPqQzI2vlhq+5k7b+FR8+SZ9LO516
	9ogK5Nq5JTmFd0Ohjkti7MNyo+3L43lwWNKY8t45UOEvL+d+nzSaEoi/36C8o9TJ0K6OmyB2nP3
	AXDVGxqLcE4fQTnMZnIeG65Se+izNtG4YuEW8UeLuv1MFebF6XRWItldB5m5peuaUi/PtcEVMA5
	Bjrv9Wmjb2JstWbazQoRSFFXxboAAenvQFievyBCpmRMklXGrH
X-Received: by 2002:a05:7300:4306:b0:2a4:7f22:cc0d with SMTP id 5a478bee46e88-2b7c8909ad3mr6722053eec.32.1770116428294;
        Tue, 03 Feb 2026 03:00:28 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:ea13:571:b19b:36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1add664sm22262633eec.26.2026.02.03.03.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 03:00:27 -0800 (PST)
Date: Tue, 3 Feb 2026 03:00:24 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, 
	=?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, Ion Agorria <ion@agorria.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v1 6/9] input: keyboard: Add driver for Asus Transformer
 dock multimedia keys
Message-ID: <aYHU5g5iOVjrHrE_@google.com>
References: <20260201104343.79231-1-clamor95@gmail.com>
 <20260201104343.79231-7-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260201104343.79231-7-clamor95@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6823-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-leds@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7CBE3D8054
X-Rspamd-Action: no action

Hi Svyatoslav,

On Sun, Feb 01, 2026 at 12:43:40PM +0200, Svyatoslav Ryhel wrote:
> +static void asus_ec_input_event(struct input_handle *handle,
> +				unsigned int event_type,
> +				unsigned int event_code, int value)
> +{
> +	struct asus_ec_keys_data *priv = handle->handler->private;
> +
> +	/* Store special key state */
> +	if (event_type == EV_KEY && event_code == KEY_RIGHTALT)
> +		priv->special_key_pressed = !!value;

Is this functionality supposed to be triggered by any keyboard or only
the dock one?

Thanks.

-- 
Dmitry

