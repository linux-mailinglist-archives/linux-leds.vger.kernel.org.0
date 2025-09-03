Return-Path: <linux-leds+bounces-5374-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1337CB415B7
	for <lists+linux-leds@lfdr.de>; Wed,  3 Sep 2025 08:58:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAD65680041
	for <lists+linux-leds@lfdr.de>; Wed,  3 Sep 2025 06:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC7222D8DC3;
	Wed,  3 Sep 2025 06:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B2QROvXO"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0211E2307;
	Wed,  3 Sep 2025 06:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756882727; cv=none; b=j507v7eWq1TSFeXHAMSOkQq6WmLpJ0FavExOrptAM3xQ/36AYIArLrfuNT5OmehDgcTiKG0jbSk2q8vpPdIs33QniPFYV1S/SjTt9JScq0CuDUEe3hl2sL8F7xZeFK5EaX+e2/iSfeuAElVz6nh1stjBz9+QO4OOlcJF+mBraKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756882727; c=relaxed/simple;
	bh=vUWUJn3wqJjqy81MaeShFl0Xntlqdjk7YZVwE3WI3Ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rNthfpfV5SrGR/d0Oln+wBj3YbGxc7H7KfJ1F75nXABq085uTad1d1g5klO7XPBTphZ2K3LKIBrMddEc7zR+m4or78tFhGW6/+aEgd0xeRpqqoe2qwqgwrJVHtovz1xVvXlU7zbAHPRFWEIbpdGXHiD7fCyCD9i6SsBCdchyuNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B2QROvXO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FCB0C4CEF0;
	Wed,  3 Sep 2025 06:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756882727;
	bh=vUWUJn3wqJjqy81MaeShFl0Xntlqdjk7YZVwE3WI3Ao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B2QROvXOkXQ3HW0H4QuCs3oLIlwFps02ZnmPTvIVeFF2ExCwCuFw0dAwPfahoLXkB
	 zCwaZeo2v/VDBJzeZEG9iD2hy8vrwHkoe0VWgbxpQatAakE5mPhnGSaI+ZbL82wWAU
	 1xds/av9xI8QxItHavhvyLkq85O2dLGmalfBj498Tgcd1hVBy1AZBEHx7xz3tZi4wj
	 hJVEy4LsidlbLjnvt6nQbzd/c8GSVPI4SM8Xa1cFygcqywd6n3UiKwi7Nfj7h5JnNV
	 5VcC4zP3ezbLUVtwYve668firjnBdd7LUk0mS5C+wq5auGeVo6zhzalQoIBW8sUY92
	 bwGgn0mleOvyQ==
Date: Wed, 3 Sep 2025 07:58:41 +0100
From: Lee Jones <lee@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Aleksandrs Vinarskis <alex@vinarskis.com>,
	Hans de Goede <hansg@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 2/2] leds: led-class: Add devicetree support to led_get()
Message-ID: <20250903065841.GX2163762@google.com>
References: <20250902-leds-v1-0-4a31e125276b@vinarskis.com>
 <010201990a1f6559-9e836a40-f534-4535-bd59-5e967d80559a-000000@eu-west-1.amazonses.com>
 <CACRpkdanKRPHOzpUV5muwCkNraRDZgoGJnEJ+_=udrtBrqVxwA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdanKRPHOzpUV5muwCkNraRDZgoGJnEJ+_=udrtBrqVxwA@mail.gmail.com>

On Wed, 03 Sep 2025, Linus Walleij wrote:

> On Tue, Sep 2, 2025 at 1:10 PM Aleksandrs Vinarskis <alex@vinarskis.com> wrote:
> 
> > From: Hans de Goede <hansg@kernel.org>
> >
> > Turn of_led_get() into a more generic __of_led_get() helper function,
> > which can lookup LEDs in devicetree by either name or index.
> 
> I don't really like __inner_function() as naming since it
> is easily confused with __COMPILER_FLAGS__ and also
> with __non_atomic_bitset().
> 
> I would name it of_led_get_inner() simply.

I'm personally okay with '__' to mean private.  There are many examples
of this already.  I'm generally less happy with '__' functions being
exported or otherwise used outside of the subsystem / core that they
reside in.

-- 
Lee Jones [李琼斯]

