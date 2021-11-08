Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB43449B1B
	for <lists+linux-leds@lfdr.de>; Mon,  8 Nov 2021 18:51:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230363AbhKHRyG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 8 Nov 2021 12:54:06 -0500
Received: from mail-oi1-f181.google.com ([209.85.167.181]:37852 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230114AbhKHRyG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 8 Nov 2021 12:54:06 -0500
Received: by mail-oi1-f181.google.com with SMTP id o83so28853236oif.4;
        Mon, 08 Nov 2021 09:51:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UDN2W+LgyqMlWM76rvNe59+fd9dlfEaT3S93NqB64Q8=;
        b=5+gySVJCDXp21H46HlMR6G1P1CdY6CcLaLIDmNZKVUVcZZMAbaTu33Lw9Kk7cMKWJX
         0Ar4ErMf6lM+qMXNzkOg96o3Gq0yq/GOcNit9TUeSgdxtuLPRvImiyWHY946cBmthq8C
         jyDxUJUlS29o2MXC7CIkDnPWlQXxqQrAWOjpaQU4nV5BYFgExcLVgwyivBn7Lvt8yeKx
         yH2DtSPxReKJrhDqzPxuumV8UqQLHroroh4UHaIw8D6qAlXEXpmPhEMdn0rXoWv+maBZ
         1tR2RHGHNeBW8od7WjliZ1L6ZzNfng95X4zy8dL6YcD3M8nnXKc/53u5FIf5FNFQM+g+
         6hcA==
X-Gm-Message-State: AOAM532Esig3c9+SBl+x7IvvoHD0N0lEiX8ihqeUxW0Puj1gxmeundaO
        9BWMJ2sB+ajnMhAC6V/j+KNOf93tFQ==
X-Google-Smtp-Source: ABdhPJxwioImQxu55KbgfM/lhv+0c5j315H2CNuWSBbODeZmONONMa/+Mmm3NyKEezY5uvQWxWg7kw==
X-Received: by 2002:a05:6808:f09:: with SMTP id m9mr112984oiw.68.1636393881659;
        Mon, 08 Nov 2021 09:51:21 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id f18sm6404497otl.28.2021.11.08.09.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 09:51:21 -0800 (PST)
Received: (nullmailer pid 3873589 invoked by uid 1000);
        Mon, 08 Nov 2021 17:51:20 -0000
Date:   Mon, 8 Nov 2021 11:51:20 -0600
From:   Rob Herring <robh@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: leds: Document none trigger
Message-ID: <YYljmDDXH5zvBgjC@robh.at.kernel.org>
References: <20211024002358.225750-1-marex@denx.de>
 <20211024084135.GB32488@duo.ucw.cz>
 <e3ea7f1d-662c-32ef-4d3d-62972af699b6@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3ea7f1d-662c-32ef-4d3d-62972af699b6@denx.de>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, Oct 24, 2021 at 08:05:55PM +0200, Marek Vasut wrote:
> On 10/24/21 10:41 AM, Pavel Machek wrote:
> > Hi!
> > 
> > > There is a trigger called "none" which triggers never, add it to the
> > > list of valid trigger values.
> > 
> > We can do this, but is it useful? If you avoid putting trigger
> > property, it will do the same thing.
> 
> It's not that simple. If you have a DT which specifies a trigger type and a
> DTO which overrides that trigger type, then the DTO cannot remove the
> trigger from the base DT, it has to set trigger type to "none". So I believe
> there is a valid use case for existence of the "none" type.

Sounds like an incorrect partitioning of base and overlays IMO. 

There's also already /delete-property/ directive though I'm not sure if 
that's supported in overlays.

Rob
