Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 961DC26BA74
	for <lists+linux-leds@lfdr.de>; Wed, 16 Sep 2020 05:02:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbgIPDCo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 15 Sep 2020 23:02:44 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:33301 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726039AbgIPDCo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 15 Sep 2020 23:02:44 -0400
Received: by mail-il1-f195.google.com with SMTP id x2so5109089ilm.0;
        Tue, 15 Sep 2020 20:02:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=2kkH+fKPwIcaA8L2IaDFfCxB/WkdvPOHAQcrCuc384I=;
        b=K2E14KXMu7tskY3RxfxdkZzk2JXbviXoZjbBtdTESugsiLpZKqDgtqELJOyudLLu1P
         kAVN3zogh4mL0+8WIskdOPfPcRvPh1vXAY1aBXTWP+2nwq6KPvaIBLXSi1qqMzcLa8NU
         Qh97di5zxEqggXslZwxSxhb6g23q7vmpEs4CLM+9rEtR00gm5Lk19mKv0r6pUUcYt/0a
         TQdYGP2yjDIDjgpmI21HSmKNBfLEWMyiy0SdkMtaNhTq1x/jbWhf1/ZO6/VC7hiYqVum
         5NaktcM+iNLThc7dzwv9f8pybh/3mShU98OrrT5Va4WB16C19XHSMRhUk4jnKvkc5st1
         Q3TQ==
X-Gm-Message-State: AOAM530RrJMfH+3JXlYgZ3m3W6KpUWRztOPUdibSbvppZrPqJj9IFJ1v
        a8UnOwGIwslDUX1HKAakazVAEzRK2Bsj
X-Google-Smtp-Source: ABdhPJzYwJwL9THFwHCRfYMkFq/xktTWk+gu/EShuPHhwHDK+Q/7lWRIUd0vD5fTUXBZExXeOGKIvw==
X-Received: by 2002:a92:9fcc:: with SMTP id z73mr12383512ilk.234.1600225362774;
        Tue, 15 Sep 2020 20:02:42 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id h15sm9714074ils.74.2020.09.15.20.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 20:02:42 -0700 (PDT)
Received: (nullmailer pid 2978329 invoked by uid 1000);
        Wed, 16 Sep 2020 03:02:39 -0000
Date:   Tue, 15 Sep 2020 21:02:39 -0600
From:   Rob Herring <robh@kernel.org>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH leds] dt-bindings: leds: cznic,turris-omnia-leds: fix
 error in binding
Message-ID: <20200916030239.GA2978272@bogus>
References: <20200915005426.15957-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200915005426.15957-1-marek.behun@nic.cz>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 15 Sep 2020 02:54:26 +0200, Marek Behún wrote:
> There is a bug in the device tree binding for cznic,turris-omnia-leds
> which causes make dt_binding_check to complain.
> 
> The reason is that the multi-led property binding's regular expression
> does not contain the `@` character, while the example nodes do.
> 
> Fix this, and also allow for longer address in property name.
> 
> Signed-off-by: Marek Behún <marek.behun@nic.cz>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: Pavel Machek <pavel@ucw.cz>
> ---
>  .../devicetree/bindings/leds/cznic,turris-omnia-leds.yaml       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!
