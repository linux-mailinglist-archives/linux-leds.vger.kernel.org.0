Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F0EB1270AA
	for <lists+linux-leds@lfdr.de>; Thu, 19 Dec 2019 23:28:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726866AbfLSW2e (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 19 Dec 2019 17:28:34 -0500
Received: from mail-oi1-f174.google.com ([209.85.167.174]:47031 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726818AbfLSW2e (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 19 Dec 2019 17:28:34 -0500
Received: by mail-oi1-f174.google.com with SMTP id p67so3800776oib.13;
        Thu, 19 Dec 2019 14:28:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=CG1TQExIKa6xTwkbkBBNEpCtxTDKQQZLa+V9hmrricU=;
        b=JPpQ3ttnv6Lj6ciAHxPCAiS16C16Y6JXZgz3k8UoljQayQlr+FQm9ZL8i80Oh4dnR4
         6f0Pq9voBY2ELbBN6iktwlyc9dY6NkgrHQXixdliYKDKUhT453xYBzNypCE+62YJklTV
         9yOC+6pRYCgzmxnzVWsyyXm4TkjzzwIjjgjhX8pTfDmM6xRHP/Bl8+ZK2KKh4ewX5V/n
         RuvxdbMK2RkxseVxCrXoYvZVhyNd8RNmHUWf4zwocUQprdk/3M5jYShcT2u22Fb8zmHV
         wqXirdeAB8xUsAsACkNwtlSQKrmPqhxMQUvQk4J0QVEXXDzfuI21VvPwQ+3a9Tz+p/gd
         0p3A==
X-Gm-Message-State: APjAAAUHvhNHUcqJb41R9GpXCVLIe0eRQqIk7aSr0xagSKBxPdekE70l
        eIKsTkBdM0alRto2trPzhXk8tFpPaw==
X-Google-Smtp-Source: APXvYqwF9Y5Ucq1Gi42m6K9hm0SFCab7SapBwLG3M8U7fm6ikNNcp1DajiIpmtkkgkM8oUnW12ocAQ==
X-Received: by 2002:aca:48d6:: with SMTP id v205mr3003921oia.10.1576794513723;
        Thu, 19 Dec 2019 14:28:33 -0800 (PST)
Received: from localhost (ip-184-205-0-249.ftwttx.spcsdns.net. [184.205.0.249])
        by smtp.gmail.com with ESMTPSA id t9sm2592913otm.76.2019.12.19.14.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 14:28:33 -0800 (PST)
Date:   Thu, 19 Dec 2019 16:27:26 -0600
From:   Rob Herring <robh@kernel.org>
To:     Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc:     linux-realtek-soc@lists.infradead.org, linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [RFC 02/25] dt-bindings: arm: realtek: Add Xnano X5
Message-ID: <20191219222726.GA20255@bogus>
References: <20191212033952.5967-1-afaerber@suse.de>
 <20191212033952.5967-3-afaerber@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191212033952.5967-3-afaerber@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 12 Dec 2019 04:39:29 +0100, =?UTF-8?q?Andreas=20F=C3=A4rber?= wrote:
> Define a compatible string for Xnano X5 OTT TV Box.
> 
> Signed-off-by: Andreas Färber <afaerber@suse.de>
> ---
>  Documentation/devicetree/bindings/arm/realtek.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
