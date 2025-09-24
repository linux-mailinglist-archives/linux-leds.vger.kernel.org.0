Return-Path: <linux-leds+bounces-5581-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7333B9B7E7
	for <lists+linux-leds@lfdr.de>; Wed, 24 Sep 2025 20:33:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 995F93BF48B
	for <lists+linux-leds@lfdr.de>; Wed, 24 Sep 2025 18:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E51382459F3;
	Wed, 24 Sep 2025 18:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efsmGQUS"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333C921D3F2
	for <linux-leds@vger.kernel.org>; Wed, 24 Sep 2025 18:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758738782; cv=none; b=bw8f2aO4iPVl1JHfe3G/1Pt7dRAIoI5lrUXMthHl07MlLQFX0ZzBJWUKHNHd/T8Ly6scuBsHsaUWG6g8pwAMDx423bI2DMyFxBj7s4+NMxB+awbfu6BLoHAGQ6P/tdFuyd62HuMSZ6n9Nq20yHIU2eK2u1q8T9ifVxPybBYCuoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758738782; c=relaxed/simple;
	bh=BPmp7/HZwCEN2P3jkfww+6QmR4v0glh9O0ulkchMmyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jxg9Rc97MiAyhQja+nSzkwvSsPTfJUclfXQMzOyuYGvPJo+CJNtqkX+BN8mQI99VOnRt/1bY8fBk/uLAz7YELjr4wg3yJD6pTFnPMXNWeyvFgHFC6ZVKo+bYTaD2otAujxlYVNSgld3OZiZR3bndN1PxSeYxKCjOH/zbr1+5l1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efsmGQUS; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-32eb45ab7a0so173836a91.0
        for <linux-leds@vger.kernel.org>; Wed, 24 Sep 2025 11:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758738780; x=1759343580; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0ZiGUngEg1bz9RIGYOxgVE+7eeU9JAJ9lijyiP/taFE=;
        b=efsmGQUSpeAlPhYHne6mC9XC+C9cNzm6ws/4Ul28qA1tV22MQq/u+/O0JouKGUlWsB
         Wg8aQR3IWtavWeaibMajUZYpQ73rb5v4O6F0KOmCFAq5Gz6PwNetVK7bWKp8Tw6mPL7E
         5ZuAfkeO8xgdBah+Js9Z3uVhESeJZWIqvVbPgx3uF/xguI+WgG4yLngOl9cmHZTTn6Ng
         LS/WfY3SG3CVQ37ATQh/qhypJX5s+AoKuctiUHKPWFvEPbAOkCNNC8g8OLLCR3UZ23Ka
         g8HLw1zh61PvqSya2YzFZyovay2iCDkNmu+7zp5GQKFxoSswiC8LBZczkewG1LArYuuk
         HlBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758738780; x=1759343580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ZiGUngEg1bz9RIGYOxgVE+7eeU9JAJ9lijyiP/taFE=;
        b=c5EcuAKvvQU/hSOVT10qbV7fVUVyldrljUVU86YyDMP74Lrem/RbjSRqQZBXfi9zOP
         FJrllsxMp2vUF6QJOp6Tt6DfqiCQpQECRLwA/BviUQStRIhxa4CH1z5q9dLfnUO/keTH
         vv5Cp+uF7yGYhDDhWiHaogbrG/YASnVQ+eOApGEHtO8fUjz9OkW0B3ndXkpu5Vh5DDAH
         KF5O4ugtFwsSMEfav0naRhb0Y8e3GdHYoTomFh3UkSc+QpSiFZHq9lNiKxMwyzPWX8ro
         BVJ9r3vXNqnyGuj+F/uKQuccDzTkYqwEaxZxABGmnvlSVxPaOwm8hDGPDCwZKaS5hJO8
         6ahg==
X-Forwarded-Encrypted: i=1; AJvYcCVY8V3Zju8ttAe7viDbF9gs0aepntCN2ecjOeOv4uR6tPI61eQ41CF8ivaUpT/6cqUy0CS1/mOJMmxx@vger.kernel.org
X-Gm-Message-State: AOJu0YwTwv+wzTMtD9mvqAnsnNeEJhKF4FlrxOVBK90f96v71hC+zVEo
	LVeycBb208HieaasP4ZppMVwNM7gcFXjTBqWZ8roaE+zBUu0xYwHSc76
X-Gm-Gg: ASbGncuCNZHsb55cW6GMdbLuTwsJ7YT97YdptpJwFhGGOO/fvpVu/SmPso8rhryqmxe
	Cdn0ZLVWnqqKDKOrflg+ecPI9fFXa9CvzeYhHv7LlU0hhvl1rVXZmwaqO4MRWTK1fqE2jqmMNi3
	yhWPWeE6bPD6cPPmFmSUEivPawX6PQq5aLyn1BGoH69wqi2KuOrpt73D1+kM3fANwemjEh7yvIA
	9OIncqd87aJ4ax9SFnpgCHyIhTNMEu1DFm0FzLVL+27stLgCGXye2BUam7Ej1aiIMWakUBHuaFE
	/V4s8WLe6wgKR3SHmJnGjnG8gaR6070cMixbCAnGFECo0YKQjSSf/uGfUJThfHZtSKChT+y7MC3
	CMkV+y8ZRdq7d6gjEKY4QfUQ=
X-Google-Smtp-Source: AGHT+IGjh8GHJkW4HrCxPM3eBOhaOjfwbgk4g/556B0RsOzYugb+CgPT02LHWIyv3xFJhWkcNdv5fA==
X-Received: by 2002:a17:90b:3d4b:b0:32d:d4fa:4c3 with SMTP id 98e67ed59e1d1-3342a2ef04fmr506703a91.31.1758738780237;
        Wed, 24 Sep 2025 11:33:00 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:f4c4:bad6:f33e:ddc9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341bda06ccsm3113092a91.7.2025.09.24.11.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 11:32:59 -0700 (PDT)
Date: Wed, 24 Sep 2025 11:32:56 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, linux-media@vger.kernel.org, 
	netdev@vger.kernel.org, linux-spi@vger.kernel.org, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Javier Carrasco <javier.carrasco@wolfvision.net>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Matthias Fend <matthias.fend@emfend.at>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Paul Elder <paul.elder@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, UNGLinuxDriver@microchip.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Mark Brown <broonie@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v2 02/16] ACPI: property: Use ACPI functions in
 acpi_graph_get_next_endpoint() only
Message-ID: <iqfarpvf72l7qbhfinopjb27qvfm7wg77d4yhuy5qyubcwtcd2@exmcuvgqr353>
References: <20250924074602.266292-1-sakari.ailus@linux.intel.com>
 <20250924074602.266292-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924074602.266292-3-sakari.ailus@linux.intel.com>

Hi Sakari,

On Wed, Sep 24, 2025 at 10:45:48AM +0300, Sakari Ailus wrote:
> Calling fwnode_get_next_child_node() in ACPI implementation of the fwnode
> property API is somewhat problematic as the latter is used in the

How exactly is this problematic?

> impelementation of the former. Instead of using
> fwnode_get_next_child_node() in acpi_graph_get_next_endpoint(), call
> acpi_get_next_subnode() directly instead.

I think we are moving into the world of mixed fwnode types with software
nodes/secondary fwnodes, so I do not think this is a step in right
direction.

Thanks.

-- 
Dmitry

