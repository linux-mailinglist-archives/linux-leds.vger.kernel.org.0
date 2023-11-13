Return-Path: <linux-leds+bounces-7-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0167E9EFF
	for <lists+linux-leds@lfdr.de>; Mon, 13 Nov 2023 15:44:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 92ED7B20A4F
	for <lists+linux-leds@lfdr.de>; Mon, 13 Nov 2023 14:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA23C20B3B;
	Mon, 13 Nov 2023 14:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yxQftqbA"
X-Original-To: linux-leds@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB0720B35
	for <linux-leds@vger.kernel.org>; Mon, 13 Nov 2023 14:43:49 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D7A2172A
	for <linux-leds@vger.kernel.org>; Mon, 13 Nov 2023 06:43:47 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4083740f92dso36674615e9.3
        for <linux-leds@vger.kernel.org>; Mon, 13 Nov 2023 06:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699886626; x=1700491426; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vNnR04yCNnmtJJPXHpBhPgt3OU1li3/fE3RG16gZ0bU=;
        b=yxQftqbAw6f0QHBpxR9ncZPjYcUuB/yZ0qjBNAWI9dd7SAW0WjjHlKB9t8sgxQIzPC
         qKXmxyfhluWP7e7mb02V56lj7K5eYUggNq/yyJO5Pydb5cj8TLPY1nlcklgy5/Z1Uyxg
         3nVsWaZ5KdvgN5ddXnMXNJ5AwJglb8s6hMuPFA7Xmxqyc+vWU0huwNiLDMAfCdrVcSgp
         Ax6RlOabzW3O+zdhvEGeajQ9yAnkpnvEY6Ji7E2GUug0Rr10kSk8JKAM+BTFeSUaK5k4
         xN239d8M8v6Roh4oDIEoUr07M0/MJywrGW/zkNWJhAuwelkUn4I18IwqoXeRHTT1gjb5
         Xclw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699886626; x=1700491426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vNnR04yCNnmtJJPXHpBhPgt3OU1li3/fE3RG16gZ0bU=;
        b=Du6ZYwtly25Ic0CQbzhApzEFqbkZzGePqFVG8VQxiS7HpsjhzcACW4455cCpkhp7sV
         ZuIT/eFpn0Px5/kB2cKRGhAUAFZvXR8g/W/h94ASr97IvsPcweoFTCr8/hygyEbXpii/
         PuAdVisABfOjTVKI1+sdmOrg2T6LUSVwperHvXbexjJ4fL3fLiMRGhhNN1dJSr4hsubO
         n1H0Uu++ICuyVnY379olEwQPMzQGmJm6ga0BvNhveSio9l9P5+G8BaiIfYKJ9g2QjLgH
         v+SAlh6mMfObSXhlEMvtfpvKdX9UTKkMFK9v31+qeXF8g/5XPwMJDw8lxv7ewhPMkmw8
         DcTQ==
X-Gm-Message-State: AOJu0YwHLTciM1raYZg7PFqf2i8kYO1b9+1P6RPFFCXLRw6YioSa++/R
	DDLfMhNzbviqP1iSuXk4JghTOQ==
X-Google-Smtp-Source: AGHT+IFyl4KKFJvEAx90PJK12JnmMzqY/5jHnJCgMk1zVzPkN1C68bLXevTx5IpixEgyODWdzc7+bg==
X-Received: by 2002:adf:a3da:0:b0:32f:7db1:22fb with SMTP id m26-20020adfa3da000000b0032f7db122fbmr4253284wrb.28.1699886625790;
        Mon, 13 Nov 2023 06:43:45 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id b11-20020a05600010cb00b0032f9688ea48sm5574339wrx.10.2023.11.13.06.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 06:43:45 -0800 (PST)
Date: Mon, 13 Nov 2023 14:43:43 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Flavio Suligoi <f.suligoi@asem.it>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Helge Deller <deller@gmx.de>, Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] dt-bindings: backlight: mp3309c: remove two
 required properties
Message-ID: <20231113144343.GA264383@aspen.lan>
References: <20231025155057.886823-1-f.suligoi@asem.it>
 <20231025155057.886823-2-f.suligoi@asem.it>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025155057.886823-2-f.suligoi@asem.it>

On Wed, Oct 25, 2023 at 05:50:57PM +0200, Flavio Suligoi wrote:
> NOTE: there are no compatibility problems with the previous version,
>       since the device driver has not yet been included in any kernel.
>       Only this dt-binding yaml file is already included in the
>       "for-backlight-next" branch of the "backlight" kernel repository.
>       No developer may have used it.

I'm afraid I got confused by the fragmented MP3309C patches from all the
different patchsets.

Please can you rebase whatever is left on v6.7-rc1 and send a single
patchset with all pending changes as a single patch set.


Thanks

Daniel.

