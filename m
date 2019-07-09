Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEEDA62DEE
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jul 2019 04:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbfGICKZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 8 Jul 2019 22:10:25 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:45116 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726084AbfGICKZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 8 Jul 2019 22:10:25 -0400
Received: by mail-io1-f66.google.com with SMTP id g20so18670087ioc.12;
        Mon, 08 Jul 2019 19:10:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Qffvn/EuenhYAFzWsle7JUq3lfeCAPQUgCkXUZV233s=;
        b=AYgv03gqpDClw0kp0gUsCJgsji0Xp1UkCfM36jgz7NF1kBjZ3OWaN+Ywgp//M0BCcN
         WXDPqY12NmPt8zXLFSVWW2OkumF2SAP0vZd9AVFPn/OGjuCFJzBRlHwSe4MHpkVEivfc
         y8SagjdK3xMfqkTPXu1mUDgKXbuzAzTglabhoekUCHt9dmW6szXoLt/WBi1m6vVIx+FY
         ME99DYdW9b7pSGGE6DQycjSW3OKJz5Q6VetepbXHjjZfTDPxeTrIXRZOaZjsPfn90fcS
         hQnGgHpoyT6/k+vfwoaqXVa8ili11FSwMeUA2OVXqrqkyguZeWStSpziav5jYpHq7fiw
         Qm7g==
X-Gm-Message-State: APjAAAXQCL2Y4XVkP76mw/Lyg5RRWGh2MExVdB1hT09ge7UOFFhiKMsW
        TCrdDMBeUEXjMgDIGOB6dcfv/kk=
X-Google-Smtp-Source: APXvYqxcHroWSewkDIXDbyCciWWPoXBtwvZt1XlUDgXXYLySbx1LnNS1Wv2gNMlckROhCRMTDFYxEQ==
X-Received: by 2002:a5d:8c84:: with SMTP id g4mr15600298ion.211.1562638224234;
        Mon, 08 Jul 2019 19:10:24 -0700 (PDT)
Received: from localhost ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id f17sm20997149ioc.2.2019.07.08.19.10.23
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 08 Jul 2019 19:10:23 -0700 (PDT)
Date:   Mon, 8 Jul 2019 20:10:22 -0600
From:   Rob Herring <robh@kernel.org>
To:     Oleh Kravchenko <oleg@kaa.org.ua>
Cc:     devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        Oleh Kravchenko <oleg@kaa.org.ua>
Subject: Re: [PATCH v3 1/2] dt-bindings: Add docs for EL15203000
Message-ID: <20190709021022.GA26615@bogus>
References: <20190608110004.8248-1-oleg@kaa.org.ua>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190608110004.8248-1-oleg@kaa.org.ua>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat,  8 Jun 2019 14:00:03 +0300, Oleh Kravchenko wrote:
> Add documentation and example for dt-bindings EL15203000.
> LED board (aka RED LED board) from Crane Merchandising Systems.
> 
> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
> ---
>  .../bindings/leds/leds-el15203000.txt         | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-el15203000.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
